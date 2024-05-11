# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.8
pkgrel=7
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons5' 'libxcursor'
         'modemmanager-qt5' 'networkmanager-qt5'
         # qml:
         'bluez-qt5' 'bluedevil' 'libcutefish' 'qt5-quickcontrols')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/settings/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-qt5_create_translation.patch::https://github.com/cutefishos/settings/pull/74.patch)
sha512sums=('abb724e999b0f339cd90a36efef3ce4249da24a186c33d026ac1ca30c858b702025d0b8e3fe7f0116b2cc0d217917b7ce1257c8f255b7ca4b8593c2031805e9c'
            '6424681922331352c279db01fcac8203d07f873640b9d77f8f139005b23dc31201230480f63b5d0a10684a88488e5a8412661c2c17a5196153c8a42c5ee620d3')

prepare() {
  cd settings-$pkgver
  patch -p1 -i ../$pkgname-qt5_create_translation.patch
  sed -e 's|CMAKE_CXX_STANDARD 11|CMAKE_CXX_STANDARD 17|' -i CMakeLists.txt # Fix build with ICU 75
}

build() {
  cd settings-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd settings-$pkgver
  DESTDIR="$pkgdir" ninja install
}
