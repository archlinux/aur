# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=avml-git
pkgver=0.13.0.r29.gb6c9739
pkgrel=1
pkgdesc='A portable volatile memory acquisition tool for Linux'
arch=('x86_64')
url='https://github.com/microsoft/avml'
license=('MIT')
makedepends=('musl' 'rust-musl')
provides=('avml')
conflicts=('avml')
source=('git+https://github.com/microsoft/avml.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/avml"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd avml
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features --target $CARCH-unknown-linux-musl
}

package() {
	cd avml
	find target/$CARCH-unknown-linux-musl/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
