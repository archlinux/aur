# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=5.1.0
pkgrel=1
pkgdesc="A string template engine based on the Django template system and written in Qt5"
arch=('i686' 'x86_64')
url="https://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
depends=('qt5-script')
makedepends=('cmake' 'doxygen')
conflicts=('grantlee-qt5')
provides=('grantlee-qt5')
replaces=('grantlee-qt5')
source=("http://downloads.grantlee.org/grantlee-$pkgver.tar.gz")
md5sums=('57989ae9f7c113e682ef1713a6f1e92a')

prepare() {
  mkdir -p build
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
  conflicts=('grantlee-qt4')

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

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
