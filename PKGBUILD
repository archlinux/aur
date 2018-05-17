# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fluid
pkgver=1.0.0
pkgrel=2
pkgdesc="Library for QtQuick apps with Material Design and Universal"
arch=('x86_64')
url='https://github.com/lirios/fluid'
license=('MPL')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('liri-qbs-shared' 'nodejs-material-design-icons' 'qt5-tools')
replaces=('qml-material')
groups=('liri')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/fluid/archive/v$pkgver.tar.gz")
sha512sums=('a9f59c7d77c40d57bd66370bd5302db583fea58e23b0830eea5e9edd002b41d3f21bdfb17748c1d31916aba15c0d5cf63335dc89ce398105a37d81311810b0b8')

prepare() {
  cd fluid-$pkgver
  ln -s /usr/lib/node_modules/material-design-icons
  sed -e '/git clone/d' -e '/rm -rf/d' -i scripts/fetch_icons.sh
  scripts/fetch_icons.sh
}

build() {
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
