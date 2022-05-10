# Maintainer: Stefan Zwanenburg <stefan [AT] zwanenburg [DOT] info>
pkgname=frawk
pkgver=0.4.6
pkgrel=1
epoch=
pkgdesc="frawk is a small programming language for writing short programs processing textual data. To a first approximation, it is an implementation of the AWK language; many common Awk programs produce equivalent output when passed to frawk."
arch=('any')
url="https://github.com/ezrosent/frawk"
license=('MIT' 'Apache')
depends=('llvm-libs')
makedepends=('cargo' 'llvm' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('3d90896a3bacfcdb1e6599f083708cc414f5c73276e0a22c0814396f3d12703669d27c6169466002852ba1dd7c39ca522c0564feba4cd135c1a96863b3069ca3')

prepare() {
	cd "$pkgname-$pkgver"
	
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target

	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=nightly

	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
