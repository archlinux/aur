# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple and fast GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('69d4cc46542eb74f3068033ddbea77f475a319413b35f334d876255d01103ada')

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
