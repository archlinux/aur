# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll
pkgver=1.6.0
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e1c3fa6ceee7fb9fc66e99b7762fde6d23a172855f6b8b19e23be48a6871f48b')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D target/release/image-roll -t "$pkgdir/usr/bin/"
	install -Dm644 src/resources/com.github.weclaw1.ImageRoll.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 src/resources/com.github.weclaw1.ImageRoll.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 src/resources/com.github.weclaw1.ImageRoll.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
