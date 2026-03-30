# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Experimental, scalable, high performance HTTP server'
pkgname=lwan
pkgver=0.7
pkgrel=1
arch=(x86_64)
license=(GPL-2.0-only)
url=https://lwan.ws
depends=(brotli zstd mimalloc luajit)
makedepends=(cmake ninja clang lld)
options=(staticlibs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lpereira/lwan/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('decda43250cad8443e87926d5c7437430767271baf53472d85a0c89dbbe68d282257a7abd44d26f8ec05f14ad7322ae563480ba11b7c780a38c28efed345bc36')

build () {
	rm -rf build

	CC=clang CXX=clang++ LDFLAGS=-fuse-ld=lld \
	cmake -S"${pkgname}-${pkgver}" -Bbuild -GNinja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DUSE_ALTERNATIVE_MALLOC=mimalloc

	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --install build
}
