# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fluid
pkgver=0.10.0
pkgrel=2
pkgdesc="Library for QtQuick apps with Material Design and Universal"
arch=('i686' 'x86_64')
url='https://github.com/lirios/fluid'
license=('MPL')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('extra-cmake-modules' 'nodejs-material-design-icons')
replaces=('qml-material')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lirios/fluid/archive/v$pkgver.tar.gz")
sha256sums=('67990122229349f4d36f561ee4a818359480bb88987e03d8bb40523284fc3cd5')

prepare() {
  mkdir -p build

  cd fluid-$pkgver
  ln -s /usr/lib/node_modules/material-design-icons
  sed -i '/git submodule/d' scripts/fetch_icons.sh
  scripts/fetch_icons.sh
}

build() {
  cd build
  cmake "$srcdir"/fluid-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_QMLDIR=lib/qt/qml \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
