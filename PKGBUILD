# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

_pkgname=stellarium
pkgname=${_pkgname}-lite
pkgver=24.3
pkgrel=1
pkgdesc="Stellarium without GPS and Telescope Control support (no gpsd and libindi dependencies)"
arch=(x86_64)
url="https://${_pkgname}.org"
license=(GPL2)
depends=(nlopt libpng libglvnd freetype2 openssl 'calcmysky>=0.3'
 qt6-charts qt6-multimedia qt6-webengine ) # 'qxlsx'
makedepends=(cmake ninja mesa qt6-tools)
optdepends=('man-db: manual pages for stellarium')
conflicts=(${_pkgname})
source=(https://github.com/Stellarium/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.asc}
        0001-Include-execution-before-any-Qt-headers.patch)
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>
md5sums=('375367ffdfbbe3e4d4443ecebacf97ae'
         'SKIP'
         'c5425c008ab745329ca61dbda116dde4')
sha256sums=('c3ffb56a049061c7754bafab176146a2c4474ecede108d650f3c7551e1eae50a'
            'SKIP'
            '8f60d020b2ac6e2dcd8b5a5df6dec28ed812818ad4684df90e5f0d4256859a5d')

prepare() {
    cd ${_pkgname}-${pkgver}
    patch -p1 -i ../0001-Include-execution-before-any-Qt-headers.patch
}

build() {
  PATH="/usr/bin/core_perl/:$PATH"
  cmake \
    -S ${_pkgname}-${pkgver} \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_EXTENSIONS=Yes \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_STANDARD=17 \
    -DCMAKE_CXX_EXTENSIONS=Yes \
    -DENABLE_QT6=1 \
    -DENABLE_SHOWMYSKY=ON \
    -DENABLE_TESTING=0 \
    -DENABLE_XLSX=0 \
    -DENABLE_GPS=0 \
    -DUSE_PLUGIN_TELESCOPECONTROL=0 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
