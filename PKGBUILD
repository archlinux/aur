# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll
pkgver=2.1.0
pkgrel=1
pkgdesc="GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9fa8be6a0404d98a692d0dbb7f5b70f3f438db1ac8b8b90e2f1f0efd3e3e659f')

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
