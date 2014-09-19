# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgbase=grantlee
pkgname=('grantlee-qt4' 'grantlee-qt5')
pkgver=0.5.0
pkgrel=1
pkgdesc="A string template engine based on the Django template system and written in Qt"
arch=('i686' 'x86_64')
url="https://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
makedepends=('qt4' 'qt5-script' 'cmake' 'doxygen')
source=("http://downloads.grantlee.org/${pkgbase}-${pkgver}.tar.gz")
md5sums=('3664b26b747be69ae77aae89829d1db1')

prepare() {
  mkdir build{,-qt4}
}

build() {
  cd build
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DGrantlee_Qt5_TRANSITIONAL=ON
  make

  cd ../build-qt4
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package_grantlee-qt5() {
  depends=('qt5-script')

  cd build
  make DESTDIR="${pkgdir}" install
}

package_grantlee-qt4() {
  depends=('qt4')
  replaces=('grantlee')
  conflicts=('grantlee')
  provides=('grantlee')

  cd build-qt4
  make DESTDIR="${pkgdir}" install
}
