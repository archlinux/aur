# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-djvulibre
_pkgname=djvulibre
pkgver=3.5.27
pkgrel=1
pkgdesc="Suite to create, manipulate and view DjVu ('déjà vu') documents (mingw-w64)"
arch=('any')
url="http://djvu.sourceforge.net/"
license=('GPL2')
makedepends=('mingw-w64-configure' 'mingw-w64-librsvg')
depends=('mingw-w64-libtiff' 'mingw-w64-hicolor-icon-theme')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/project/djvu/DjVuLibre/${pkgver}/djvulibre-${pkgver}.tar.gz"
        "djvulibre-3.5.27-win32.patch")
sha256sums=('e69668252565603875fb88500cde02bf93d12d48a3884e472696c896e81f505f'
            '21f74b031fde9d61fbf6873aeb78876a4c4c515bb1982b86d6a8f553f08df579')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/djvulibre-3.5.27-win32.patch

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
