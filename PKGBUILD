# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

_pkgname=stellarium
pkgname=${_pkgname}-lite
pkgver=24.1
pkgrel=1
pkgdesc="Stellarium without GPS and Telescope Control support (no gpsd and libindi dependencies)"
arch=(x86_64)
url="https://${_pkgname}.org"
license=(GPL2)
depends=('libpng' 'libglvnd' 'freetype2' 'openssl' 'calcmysky>=0.3'
         'qt6-charts' 'qt6-multimedia' 'qt6-webengine' 'nlopt') # 'qxlsx'
makedepends=('cmake' 'ninja' 'mesa' 'qt6-tools')
optdepends=('man-db: manual pages for stellarium')
conflicts=(${_pkgname})
source=(https://github.com/Stellarium/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz{,.asc})
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>
md5sums=('240f71a2a707d7b5cf321b20963cc82e'
         'SKIP')
sha256sums=('5a48fb2c5b17c9ebfa23153604f470dc87a5eab5fafb0510f71e115ac76072a8'
            'SKIP')

#prepare() {
#  # FIXME: https://github.com/Stellarium/stellarium/issues/3132#issuecomment-1485304021
#  # sed -i 's/SOURCE_SUBDIR QXlsx/SOURCE_SUBDIR QXlsxQt${QT_VERSION_MAJOR}/' ${pkgname}-${pkgver}/CMakeLists.txt
#  # TODO: https://github.com/Stellarium/stellarium/issues/3038
#  cd ${pkgname}-${pkgver}
#  patch -p1 -i ../indi-2.0.patch
#}

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
    -DENABLE_LIBGPS=0 \
    -DUSE_PLUGIN_TELESCOPECONTROL=0 \
    -DPREFER_SYSTEM_INDILIB=No \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
