# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=oniongen-rs
pkgver=0.6.4
pkgrel=1
license=('MIT')
pkgdesc="A .v3 onion address generator"
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
makedepends=(cargo)
sha256sums=('fe6f848940fbfa6b552d5928e37e3ed32e4fb68e7f2c289a7f2f03a78acfa863')

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
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
