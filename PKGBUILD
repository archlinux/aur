# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-djvulibre
_pkgname=djvulibre
pkgver=3.5.28
pkgrel=1
pkgdesc="Suite to create, manipulate and view DjVu ('déjà vu') documents (mingw-w64)"
arch=('any')
url="http://djvu.sourceforge.net/"
license=('GPL2')
makedepends=('mingw-w64-configure' 'mingw-w64-librsvg')
depends=('mingw-w64-libtiff' 'mingw-w64-hicolor-icon-theme')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/project/djvu/DjVuLibre/${pkgver}/djvulibre-${pkgver}.tar.gz")
sha256sums=('fcd009ea7654fde5a83600eb80757bd3a76998e47d13c66b54c8db849f8f2edc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
