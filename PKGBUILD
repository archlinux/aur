# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

_pkgname=stellarium
pkgname=${_pkgname}-lite
pkgver=25.1
pkgrel=3
pkgdesc="Stellarium without GPS and Telescope Control support (no gpsd and libindi dependencies)"
arch=(x86_64)
url="https://${_pkgname}.org"
license=(GPL-2.0-or-later)
depends=(nlopt libpng libglvnd freetype2 openssl 'calcmysky>=0.3'
    qt6-charts qt6-multimedia qt6-webengine )
makedepends=(cmake ninja mesa qt6-tools)
optdepends=('man-db: manual pages for stellarium')
conflicts=(${_pkgname})
_patches=(bbcd60ae52b6f1395ef2390a2d2ba9d0f98db548.diff
          a27f10f55cdd0bcdbe74071e5b020e0297b8c57a.diff)
source=(https://github.com/Stellarium/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.asc}
        ${_patches[@]/#/https://github.com/Stellarium/stellarium/commit/})
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>
sha256sums=('2ecbc90f0bc7f1355e4d6497db2adc9119000d88eb18a3b4257ce249c4bea2f0'
            'SKIP'
            '1797a4a633a39d989ea7e688dd600a19655ba1d798b74972f9f85e6452152cfd'
            'ae9d9b45ad0dca479d5cd1a5d8b07680fa8798a2da7b01d343bf714023f5e19c')

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
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
