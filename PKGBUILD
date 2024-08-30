# Maintainer: Citorva <packaging@citorva.fr>

pkgname=extism
pkgver=1.5.0
pkgrel=1
pkgdesc="Runtime library for the extism framework"
arch=('x86_64')
url="https://github.com/extism/extism"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'gcc' 'make')
# provides nothing
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6718b0e1011224c0d18d1ee74f0b3708bb3e66c314daeb666a00d9913eb2751')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	
	export RUSTUP_TOOLCHAIN=stable
	# cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" # Currently, the lock file is out to date
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects' make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}/
	
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -ffat-lto-objects' make bench
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/

	make DEST="${pkgdir}/" install
}
