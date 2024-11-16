# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: Nicola Murino
# Contributor: Michel Zou
# Contributor: xantares

pkgname=mingw-w64-expat
pkgver=2.6.4
pkgrel=1
pkgdesc="An XML parser library (mingw-w64)"
arch=(any)
url="http://expat.sourceforge.net"
license=("MIT")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2")
sha512sums=('cd21a5cfafe15b747e6e8964e35eed52a446373811d02bc3730b3e616ccd066f07e4cdbd48f445d6fddfb931841b28072016248b19a8add9cf087cbf83ba18da')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/expat-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure --without-docbook --without-examples --without-tests --without-xmlwf ..
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/expat-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
		rm -r "$pkgdir/usr/${_arch}/share"
	done
}
# vim: set sw=2 ts=2 et:
