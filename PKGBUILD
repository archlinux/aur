# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: Nicola Murino
# Contributor: Michel Zou
# Contributor: xantares
# Contributor: NEOAPPS <neo@obsidianos.xyz> <asd22.info@gmail.com>

pkgname=mingw-w64-expat
pkgver=2.7.4
pkgrel=1
pkgdesc="An XML parser library (mingw-w64)"
arch=(any)
url="http://expat.sourceforge.net"
license=("MIT")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2")
sha256sums=('e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0')

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
