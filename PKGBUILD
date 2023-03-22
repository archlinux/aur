# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libidn2
pkgver=2.3.4
pkgrel=1
pkgdesc="A free software implementation of IDNA2008 (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libidn"
license=("GPL3, LGPL3")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libunistring)
options=(staticlibs !strip !buildflags)
source=("https://ftp.gnu.org/pub/gnu/libidn/libidn2-${pkgver}.tar.gz")
sha256sums=('93caba72b4e051d1f8d4f5a076ab63c99b77faee019b72b9783b267986dbb45f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libidn2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-nls --disable-doc
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libidn2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
