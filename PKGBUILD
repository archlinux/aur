# Maintainer: crab2313 <crab2313@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-libusb
pkgver=1.0.26
pkgrel=1
pkgdesc="Library that provides generic access to USB devices (mingw-w64)"
arch=(any)
url="http://libusb.info"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
conflicts=('mingw-w64-libusbx')
replaces=('mingw-w64-libusbx')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/libusb/libusb/releases/download/v${pkgver}/libusb-${pkgver}.tar.bz2")
sha256sums=('12ce7a61fc9854d1d2a1ffe095f7b5fac19ddba095c259e6067a46500381b5a5')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

build() {
  cd "${srcdir}/libusb-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libusb-$pkgver/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
