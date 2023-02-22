# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=kipr
pkgver=0.3.0
pkgrel=2
pkgdesc='Command Line Password Manager'
license=('MIT')
arch=('any')
source=("https://github.com/grahamking/kipr/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=(cargo)
depends=("gnupg")
optdepends=('xclip: Clipoard functionality')
sha256sums=('7dce3d95d9bd1f7b3f99abc5afc15de2c46c4f81972c90c907d702bae50ffd25')

prepare() {
	cd "$pkgname-$pkgver"
	case $CARCH in 
		"pentium4")
			cargo fetch --locked --target "i686-unknown-linux-gnu"
			;;
		*)
			cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
			;;
	esac
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
