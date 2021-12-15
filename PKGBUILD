# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=1.0.0
pkgrel=2
pkgdesc='Fast linker'
arch=(x86_64)
url='https://github.com/rui314/mold'
license=(AGPL3)
depends=(mimalloc openssl tbb zlib)
makedepends=(clang cmake xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(56ebc267370548a2f91a71ebeed87871cede6f564c29dc7d44a499b95fe570f6e9c8a717baf2d9e235c7057c41e735b315493bd23d3b44574d2a44b14aaf5ef8)

_make () {
	# Using SYSTEM_TBB=1 needs tbb 2021.4.0; which in Manjaro
	# is still in # the testing repository at the moment.
	make -C "${pkgname}-${pkgver}" PREFIX=/usr LTO=1 SYSTEM_MIMALLOC=1 "$@"
}

build () {
	_make
}

check () {
	# TODO: Currently one of the tests does not pass due to unexpected
	#       behaviour in the current version of Binutils in Arch.
	: _make check
}

package() {
	_make DESTDIR="${pkgdir}" install
}
