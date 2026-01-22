# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=gcompris-qt
pkgver=25.1.1
pkgrel=1
pkgdesc="Educational software suite comprising of numerous activities for children aged 2 to 10"
arch=('x86_64')
url="https://gcompris.net/"
license=('AGPL-3.0-only')
depends=('qt6-base' 'qt6-charts' 'qt6-declarative' 'qt6-imageformats'
         'qt6-multimedia' 'qt6-sensors' 'qt6-svg' 'qml-box2d'
         'gst-plugins-good' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools')
replaces=('gcompris' 'gcompris-data')
source=("https://download.kde.org/stable/gcompris/qt/src/$pkgname-$pkgver.tar.xz"{,.sig}
        qt6-private-modules.patch)
sha256sums=('636de9168bf5fd628faf061845f188f2c385d2da7f92c4b0449139ce6c6da12a'
            'SKIP'
            'a16d93e0228dec8e4c15316656aa92df5a0f49ff2d198e8b3275cd90b947e1d8')
sha512sums=('b03025151978103030a6d456e5ed195879528902c45fc6b2904f8858c7e8516aab79130ad1e4e9591c59707b7a1c1385a39fd0a0003a775cb2cd86866d8054c1'
            'SKIP'
            '3e35795407c567ca72c5371e44bf73a696376209171cb22e57e4590d8b8295fa66fdcafa40a0fcf816bc9244b25c427987b50e2aad6a21052650b1cfaa58b3c9')
validpgpkeys=('D2FAAB621F618D42685B427B63D7264C05687D7E') # Timothée Giet <animtim@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < "$startdir/qt6-private-modules.patch"
  sed -i 's/Box2D\.2.0/Box2D/g' src/core/ApplicationInfo.cpp
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPILE_DOC=ON \
    -DQML_BOX2D_LIBRARY=/usr/lib/qt6/qml/Box2D
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
