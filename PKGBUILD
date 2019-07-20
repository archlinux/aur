# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=mingw-w64-hidapi
pkgver=0.9.0
pkgrel=1
pkgdesc="Simple library for communicating with USB and Bluetooth HID devices (mingw-w64)"
arch=(any)
url="https://github.com/libusb/hidapi"
license=('GPL3' 'BSD' 'custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libusb/hidapi/archive/hidapi-${pkgver}.tar.gz")
sha256sums=('630ee1834bdd5c5761ab079fd04f463a89585df8fcae51a7bfe4229b1e02a652')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/hidapi-hidapi-${pkgver}"

  ./bootstrap
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/hidapi-hidapi-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${srcdir}/hidapi-hidapi-${pkgver}"
  install -m644 LICENSE.txt LICENSE-bsd.txt LICENSE-orig.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
