# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=avml-git
pkgver=v0.3.0.r2.g9e474c2
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
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd avml
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --target $CARCH-unknown-linux-musl
}

package() {
	cd avml
	find target/$CARCH-unknown-linux-musl/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
