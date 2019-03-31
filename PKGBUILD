# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fluid
pkgver=1.1.0
pkgrel=1
pkgdesc="Library for QtQuick apps with Material Design and Universal"
arch=('x86_64')
url='https://github.com/lirios/fluid'
license=('MPL')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('liri-qbs-shared' 'nodejs-material-design-icons' 'qt5-tools' 'clang')
replaces=('qml-material')
groups=('liri')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/fluid/archive/v$pkgver.tar.gz")
sha512sums=('73796930c6273c2fcc89cfe54d1b5cb34a98a3f4af5f564da305efa83e4ef4e451d1244f3b59edaa76a17ef09de066966598f85f67f0dd7442f2ca0e123d55a9')

prepare() {
  cd fluid-$pkgver
  ln -s /usr/lib/node_modules/material-design-icons
  sed -e '/git clone/d' -e '/rm -rf/d' -i scripts/fetch_icons.sh
  scripts/fetch_icons.sh
}

build() {
  export QT_VER=5.12

  cd fluid-$pkgver
  qbs setup-toolchains --type gcc /usr/bin/g++ gcc
  qbs setup-qt /usr/bin/qmake-qt5 qt5
  qbs config profiles.qt5.baseProfile gcc
  qbs build --no-install -d build profile:qt5 modules.lirideployment.prefix:/usr \
                                              modules.lirideployment.qmlDir:/usr/lib/qt/qml
}

package() {
  cd fluid-$pkgver
  qbs install -d build --no-build -v --install-root "$pkgdir" profile:qt5
}
