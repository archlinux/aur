# Maintainer: Citorva <packaging@citorva.fr>

pkgname=extism
pkgver=1.6.0
pkgrel=1
pkgdesc="Runtime library for the extism framework"
arch=('x86_64')
url="https://github.com/extism/extism"
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'gcc' 'make')
# provides nothing
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2dec013678f58f4321337a7c07fa45a34a4987a3e9d84c1315ec8e89152ba79e')

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

	mkdir ${pkgdir}/usr

	make DEST="${pkgdir}/usr" install
}
