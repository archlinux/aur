# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=stellarium
pkgver=1.0
pkgrel=2
pkgdesc="Software which renders realistic skies in real time with OpenGL"
arch=(x86_64)
url="https://${pkgname}.org"
license=(GPL2)
depends=('libpng' 'libglvnd' 'freetype2' 'openssl' 'gpsd' 'calcmysky'
  'qt6-charts' 'qt6-serialport' 'qt6-multimedia' 'qt6-positioning' 'qt6-webengine')
makedepends=('cmake' 'ninja' 'mesa' 'qt6-tools')
source=(https://github.com/Stellarium/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz{,.asc}
  ${pkgname}_qt6.patch::https://github.com/Stellarium/${pkgname}/commit/02feef10d62d8fdfae5d02b9217593c29558c7fd.patch)
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>
md5sums=('cb52c9e6726a802033c8b02c0774e344'
  'SKIP'
  'a2a58950dfb741a287f3e945edf48326')
sha1sums=('bd520948268b90a37dabbf5ee4048c598fcbbf50'
  'SKIP'
  'b7b3f3c404a7e60de5ee9d7e78027d6906da1c72')
sha256sums=('5a1912c1c1eb04b22128c6fc98935e87f9faa3844796285b01418139b5d5f33f'
  'SKIP'
  '6e6544da78bdb7c35e915cfe0fb8ad634afa7b55abbb4b1130b1064e426e0f17')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/Stellarium/stellarium/issues/2709
  patch -p1 -i ../${pkgname}_qt6.patch
}

build() {
  PATH="/usr/bin/core_perl/:$PATH"
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_EXTENSIONS=No \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_STANDARD=11 \
    -DCMAKE_CXX_EXTENSIONS=No \
    -DENABLE_QT6=1 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  find "${pkgdir}" -type d -empty -delete
}
