# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-atkmm
pkgver=2.28.0
pkgrel=1
pkgdesc="C++ bindings for ATK (mingw-w64)"
url="https://www.gtkmm.org/"
arch=('any')
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-atk' 'mingw-w64-glibmm' 'mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/atkmm/${pkgver%.*}/atkmm-${pkgver}.tar.xz")
sha256sums=('4c4cfc917fd42d3879ce997b463428d6982affa0fb660cafcc0bc2d9afcedd3a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/atkmm-${pkgver}
  CPPFLAGS+=" -D_REENTRANT"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --disable-documentation
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/atkmm-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
