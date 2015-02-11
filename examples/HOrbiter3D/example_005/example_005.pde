HDrawablePool pool;
HColorPool colors;

void setup() {
	size(640, 640, P3D);
	H.init(this).background(#202020);
	smooth();

	HCanvas c = new HCanvas(P3D).autoClear(false).fade(10);
	H.add(c);

	colors = new HColorPool(#ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600);

	pool = new HDrawablePool(42);
	pool.autoParent(c)

		.add(
			new HShape("mon.svg").enableStyle(false)
				.scale(0.15)
				.strokeWeight(1/.15)
				.rotation(45)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;

					d.fill(colors.getColor());

					float r = floor(random(10, 40)) * 10;

					HOrbiter3D o = new HOrbiter3D(width/2, height/2, 0)
						.zSpeed(1)
						.ySpeed(0.3)
						.radius(r)
						.zAngle(pool.currentIndex() * 2)
						.yAngle(pool.currentIndex() * (180 / 42))
					;

					HOrbiter3D o2 = new HOrbiter3D()
						.target(d)
						.zSpeed(5)
						.ySpeed(1)
						.radius(75)
						.zAngle(360.0 / 42 * pool.currentIndex())
						.parent(o)
					;

				}
			}
		)

		.requestAll()
	;

}

void draw() {
	H.drawStage();
}
