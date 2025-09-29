# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

_pkgname=stellarium
pkgname=${_pkgname}-lite
pkgver=25.3
pkgrel=1
pkgdesc="Stellarium without GPS and Telescope Control support (no gpsd and libindi dependencies)"
arch=(x86_64)
url="https://${_pkgname}.org"
license=(GPL-2.0-or-later)
depends=(nlopt libpng libglvnd freetype2 openssl 'calcmysky>=0.3'
    qt6-charts qt6-multimedia qt6-webengine )
makedepends=(cmake ninja mesa qt6-tools)
optdepends=('man-db: manual pages for stellarium')
conflicts=(${_pkgname})
_patches=()
source=(https://github.com/Stellarium/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.asc}
        ${_patches[@]/#/https://github.com/Stellarium/stellarium/commit/})
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>
sha256sums=('5a229d1d0cc12d15d2a9a17fd53f52be819268a929cbaeb9077c1d8840082cda'
            'SKIP')

prepare() {
    cd ${_pkgname}-${pkgver}
    for p in ${_patches[@]}; do
        patch -p1 < ../$p
    done
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
