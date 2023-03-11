# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=oniongen-rs
pkgver=0.6.5
pkgrel=1
license=('MIT')
pkgdesc="A .v3 onion address generator"
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
makedepends=(cargo)
sha256sums=('7e616966b3c5bb55e7fcfcf04ac1d2e9bafd7944e8b8ed0a99cba8a745bce067')

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
