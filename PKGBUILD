# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="hidapi"
pkgname="lib32-${_name}"
pkgver=0.14.0
pkgrel=1
pkgdesc="Simple library for communicating with USB and Bluetooth HID devices (32-bit)"
arch=('x86_64')
url="https://github.com/libusb/${_name}"
license=('GPL-3.0-only OR BSD-3-Clause')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc' 'lib32-systemd')
makedepends=('cmake>=3.1.3' 'lib32-libusb>=1.0.9')
optdepends=('lib32-libusb>=1.0.9: for hidapi-libusb')
provides=("lib${_name}-"{hidraw,libusb}'.so')
_pkgsrc="${_name}-${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${_name}-${pkgver}.tar.gz")
sha512sums=('66a045144f90b41438898b82f0398e80223323ebfe6e4f197d2713696bb3ae60f36aea5a37a9999b34b12294783fd7e4c28c6e785462559cbe21276009da1eac')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
