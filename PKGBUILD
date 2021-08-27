# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Tyler Johnson <TylerMackJ@gmail.com>

pkgname=hexcat
pkgver=2.3.4
pkgrel=2
pkgdesc="A hex display with Unicode symboles for specials."
url="https://github.com/TylerMackJ/Hexcat"
license=('GPL3')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fcafee507d839c65e9b8d83d49c915ca796ed2fa9e2dada613b2728c4b66b001')

prepare() {
	cd "${pkgname^}-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "${pkgname^}-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	cd "${pkgname^}-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname^}-$pkgver"
	install -Dm 755 target/release/hexcat -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
