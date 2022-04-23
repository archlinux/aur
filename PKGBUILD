# Maintainer: Gabriel Felipe Huwe <gabrielhuwe@gmail.com>

pkgname=stellarium-multithreaded-build
_pkgname=stellarium
pkgver=0.22.1
pkgrel=1
pkgdesc="Software which renders realistic skies in real time with OpenGL (builds using multithreading)"
arch=(x86_64)
url="https://${_pkgname}.org"
license=(GPL2)
depends=('libpng' 'libgl' 'freetype2' 'openssl' 'gpsd'
  'qt5-serialport' 'qt5-multimedia' 'qt5-location' 'qt5-charts' 'qt5-script')
makedepends=('cmake' 'mesa' 'qt5-tools' 'qt5-webengine')
provides=('stellarium')
source=(https://github.com/Stellarium/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.asc})
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>
md5sums=('c0f9822386d09485ea2e3e031d0cbcdb' 'SKIP')
sha1sums=('55b5915dfb616b9748e1c2d2de6150f7159cf36c' 'SKIP')
sha256sums=('61a595ecc345dcc7517359573d0dc772e67ecaf6d52fefab142a77c92cf3fa24'
  'SKIP')

build() {
  PATH="/usr/bin/core_perl/:$PATH"
  cmake \
    -S ${_pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_EXTENSIONS=No \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_STANDARD=11 \
    -DCMAKE_CXX_EXTENSIONS=No \
    -Wno-dev
  cmake --build build --target all -j $(grep -c processor /proc/cpuinfo)
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  find "${pkgdir}" -type d -empty -delete
}
