# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openorienteering
_pkgname=mapper
pkgname=${_orgname}-${_pkgname}
pkgver=0.6.8
pkgrel=1
pkgdesc="Orienteering mapmaking program"
arch=('i686' 'x86_64')
url="http://openorienteering.github.io/apps/mapper/"
license=('GPL3')
depends=('qt5-base>=5.3' 'polyclipping>=6.1.3a' 'proj>=4.9.2')
makedepends=('cmake>=3.1' 'qt5-tools>=5.3' 'doxygen' 'libcups')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8c7daf459c10f1affc40904c6048a52711c758c52752208e36395dc3256587ee')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  rm -rf build
  mkdir -p build
  cd build

  cmake ..                      \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMapper_BUILD_QT=0         \
    -DMapper_BUILD_CLIPPER=0    \
    -DMapper_BUILD_PROJ=0       \
    -DMapper_BUILD_DOXYGEN=0    \
    -DMapper_PACKAGE_NAME=${pkgname} \
    -Wno-dev
  make -j$(nproc)
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir}/ install
  rm -fr ${pkgdir}/DEBIAN
}
