# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.8
pkgrel=10
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'libxcursor'
         # qml:
         'bluez-qt5' 'bluedevil' 'libcutefish' 'qt5-quickcontrols')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
source=(git+https://github.com/cutefishos/settings#tag=$pkgver
        $pkgname-qt5_create_translation.patch::https://github.com/cutefishos/settings/pull/74.patch
        icu-76.patch)
sha512sums=('b68c17cbf9f03d2ca68e4586cef032cf89109389329438a98397b242635ed8fe19eb0b4f198d45bd8b027bc41c6062066fe7063f87b5c1dbd362993ea91eb824'
            '6424681922331352c279db01fcac8203d07f873640b9d77f8f139005b23dc31201230480f63b5d0a10684a88488e5a8412661c2c17a5196153c8a42c5ee620d3'
            'ca0804617ddc11ee68cab77076d7239770ee3ff03f59114854b64ad02128df7e233e99652ddb579150177ebf97e44bb6f10c6a19fe82fc78d8470fd3b6b62707')

prepare() {
  cd settings
  patch -p1 -i ../$pkgname-qt5_create_translation.patch
  patch -p1 -i ../icu-76.patch
  sed -e 's|CMAKE_CXX_STANDARD 11|CMAKE_CXX_STANDARD 17|' -i CMakeLists.txt # Fix build with ICU 75
# Drop unused dependencies
  sed -e '/ModemManagerQt/d' -i CMakeLists.txt
}

build() {
  cd settings

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd settings
  DESTDIR="$pkgdir" ninja install
}
