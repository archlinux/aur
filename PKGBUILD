# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openorienteering
_pkgname=mapper
pkgname=${_orgname}-${_pkgname}
pkgver=0.6.7
pkgrel=2
pkgdesc="Orienteering mapmaking program"
arch=('i686' 'x86_64')
url="http://openorienteering.github.io/apps/mapper/"
license=('GPL3')
depends=('qt5-base>=5.5.1' 'polyclipping>=6.1.3a' 'proj>=4.9.2')
makedepends=('cmake>=2.8.12' 'qt5-tools>=5.5.1' 'doxygen' 'libcups')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9dfecd5aa05665e853f8acce07ee9c036c076e117ea838a73e6098e742caab9d')

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
