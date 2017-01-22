# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=kdreports-git
pkgver=1.7.50.r150.8654a8b
pkgrel=1
pkgdesc="A Qt library for creating printable reports"
arch=('i686' 'x86_64')
url="http://www.kdab.com/kd-reports/"
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('git' 'cmake>=2.8.12')
conflicts=('kdreports')
provides=('kdreports')
source=("git://github.com/KDAB/KDReports.git")
sha512sums=('SKIP')

pkgver() {
  cd KDReports
  _ver="$(cat CMakeLists.txt | grep -m3 -e ${PROJECT_NAME}_VERSION_MAJOR -e ${PROJECT_NAME}_VERSION_MINOR -e ${PROJECT_NAME}_VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../KDReports \
    -DKDReports_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR="${pkgdir}/" install
  rm ${pkgdir}/usr/share/doc/KDReports/LICENSE.*
  rm ${pkgdir}/usr/share/doc/KDReports/kdreports.pri
  cd KDReports
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/kdreports/LICENSE.txt
  install -Dm644 LICENSE.US.txt ${pkgdir}/usr/share/licenses/kdreports/LICENSE.US.txt
  install -Dm644 LICENSE.GPL.txt ${pkgdir}/usr/share/licenses/kdreports/LICENSE.GPL.txt
  install -Dm644 LICENSE.LGPL.txt ${pkgdir}/usr/share/licenses/kdreports/LICENSE.LGPL.txt
  install -Dm644 README-commercial.txt ${pkgdir}/usr/share/doc/KDReports/README-commercial.txt
}
