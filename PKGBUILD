# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=avml
pkgver=0.10.0
pkgrel=1
pkgdesc='A portable volatile memory acquisition tool for Linux'
arch=('x86_64')
url='https://github.com/microsoft/avml'
license=('MIT')
makedepends=('musl' 'rust-musl')
source=("https://github.com/microsoft/avml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa8017cc7bb94f83cada343dc82dd4a5ee1e3a0b96f7b7ff91e9bb67fce72013')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-musl"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --target $CARCH-unknown-linux-musl
}

package() {
	cd "$pkgname-$pkgver"
	find target/$CARCH-unknown-linux-musl/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
