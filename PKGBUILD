# Maintainer: Stefan Zwanenburg <stefan [AT] zwanenburg [DOT] info>
pkgname=frawk
pkgver=0.4.5
pkgrel=1
epoch=
pkgdesc="frawk is a small programming language for writing short programs processing textual data. To a first approximation, it is an implementation of the AWK language; many common Awk programs produce equivalent output when passed to frawk."
arch=('any')
url=""
license=('MIT' 'Apache')
depends=('llvm-libs')
makedepends=('cargo' 'llvm' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('377c6a4926b7f30cdb680d6eb96491e35ae21fc4285450622088c3e0001ed352bd1d0793eacdba2cb3c9094af437bc334f7ef8eefee4e4d8a44ecd0afb3313a7')

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
