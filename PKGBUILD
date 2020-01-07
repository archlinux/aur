# Maintainer: crab2313 <crab2313@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-libusb
pkgver=1.0.23
pkgrel=1
pkgdesc="Library that provides generic access to USB devices (mingw-w64)"
arch=(any)
url="http://libusb.info"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
conflicts=('mingw-w64-libusbx')
replaces=('mingw-w64-libusbx')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/libusb/libusb/releases/download/v${pkgver}/libusb-${pkgver}.tar.bz2")
sha256sums=('db11c06e958a82dac52cf3c65cb4dd2c3f339c8a988665110e0d24d19312ad8d')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  unset LDFLAGS
  cd "libusb-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch} \
                 --enable-shared
    # They broke parallel building in libusb 1.20
    make -j1
    popd
  done
}

package () {
  cd "libusb-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    pushd build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    popd
  done
}
