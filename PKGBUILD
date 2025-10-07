# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: Nicola Murino
# Contributor: Michel Zou
# Contributor: xantares

pkgname=mingw-w64-expat
pkgver=2.7.3
pkgrel=1
pkgdesc="An XML parser library (mingw-w64)"
arch=(any)
url="http://expat.sourceforge.net"
license=("MIT")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2")
sha512sums=('92dd8a31a88ca73d5d8890be40c231ec037d8d13f6059a88bcf7bfaaa77c1c94dc2874f2dae508c0d077a3798bc006cfe9d7d0a918e08a67149d332c7fce4d23')

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
