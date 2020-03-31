# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-gtkmm
_pkgname=gtkmm
pkgver=2.24.5
pkgrel=2
pkgdesc="C++ bindings for GTK+ 2 (mingw-w64)"
url="https://www.gtkmm.org/"
arch=('any')
license=('LGPL')
depends=('mingw-w64-gtk2' 'mingw-w64-pangomm' 'mingw-w64-atkmm')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/gtkmm/${pkgver%.*}/gtkmm-${pkgver}.tar.xz")
sha256sums=('0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  CPPFLAGS+=" -D_REENTRANT"
  cd "${srcdir}/gtkmm-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS+=" -lssp" ${_arch}-configure \
      --disable-documentation \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gtkmm-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
