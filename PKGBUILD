# Maintainer: Christian Bühler <christian@cbuehler.de>

pkgname=qt-solutions-git
pkgver=47.ad9bc46
pkgrel=1
pkgdesc="Components from the discontinued Qt Solutions product, a collection of minor Qt add-ons and former Qt modules which for various reasons have been pruned from Qt itself. (GIT version)"
arch=('i686' 'x86_64')
url="http://qt.gitorious.org/qt-solutions"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
provides=('qt-solutions')
conflicts=('qt-solutions')
source=(git://github.com/qtproject/qt-solutions.git)
md5sums=('SKIP')

pkgver() {
  cd qt-solutions
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  sed "s|\$\$DESTDIR|${pkgdir}/usr/lib|g" -i qt-solutions/{qtservice,qtsingleapplication}/buildlib/buildlib.pro
}

build() {
  cd "${srcdir}/qt-solutions/qtservice"
  ./configure -library
  qmake-qt5
  make

  cd "${srcdir}/qt-solutions/qtsingleapplication"
  ./configure -library
  qmake-qt5
  make
}

package() {

  cd "${srcdir}/qt-solutions/qtservice/src"
  for i in QtServiceBase QtServiceController qtservice.h; do
    install -Dm644 "${i}" "${pkgdir}/usr/include/${i}"
  done
  cd ..
  make install

  cd "${srcdir}/qt-solutions/qtsingleapplication/src"
  for i in QtSingleApplication qtsingleapplication.h; do
    install -Dm644 "${i}" "${pkgdir}/usr/include/${i}"
  done
  cd ..
  make install
}
