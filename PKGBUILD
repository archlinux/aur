# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fluid
pkgver=1.2.0
pkgrel=1
pkgdesc="Library for QtQuick apps with Material Design and Universal"
arch=('x86_64')
url='https://github.com/lirios/fluid'
license=('MPL')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-wayland')
# clang: for qdoc
makedepends=('liri-cmake-shared' 'nodejs-material-design-icons' 'qt5-tools' 'clang')
replaces=('qml-material')
groups=('liri')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/fluid/archive/v$pkgver.tar.gz")
sha512sums=('01eae32283e8078baa11a9a2a802ec64cf22f37b2cace8d6ab1a4ac6c8d752ee0fae823cccba586fe0336165a72f66a59be8b613897ded01693b6e38cba8f536')

prepare() {
  cd $pkgname-$pkgver
  ln -s /usr/lib/node_modules/material-design-icons
  sed -e '/git clone/d' -e '/rm -rf/d' -i scripts/fetch_icons.sh
  scripts/fetch_icons.sh
  mkdir -p build
}

build() {
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DFLUID_USE_SYSTEM_LCS:BOOL=ON ..
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
