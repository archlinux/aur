# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-tslib
_pkgname=tslib
pkgver=1.22
pkgrel=1
pkgdesc="Touchscreen Access Library (mingw-w64)"
arch=('any')
url="https://github.com/kergoth/tslib"
license=('GPL2')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/kergoth/tslib/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --sysconfdir=/usr/${_arch}/etc \
      --disable-input \
      --disable-touchkit \
      --disable-waveshare \
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
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/lib/ts/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/ts/*.a
  done
}
