# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-calculator
pkgver=0.4
pkgrel=3
pkgdesc="CutefishOS Calculator"
arch=('x86_64')
url="https://github.com/cutefishos/calculator"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/calculator/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'fix-build.patch')
sha512sums=('2c9bf5b7cf749066a87440c101658b33e4cc99f4510f0efd44a91ba0cd25a1c39414d3c8f4a4dbfa1204d4856a195f16e746985463950b93f87790fece74a0ec'
            '044a3d7833e7d02caeec3a45f24db33e234f644aef367761f2f960231fe2ed2833126132c8b348bacc4c92520560f34c71176a88db64109e6814c28a560fe767')

prepare() {
  cd calculator-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Use standard icon name
  sed -i 's/QIcon::fromTheme("cutefish-calculator")/QIcon::fromTheme("accessories-calculator")/' main.cpp
  sed -i 's|image://icontheme/cutefish-calculator|image://icontheme/accessories-calculator|' qml/main.qml
  sed -i 's/Icon=cutefish-calculator/Icon=accessories-calculator/' cutefish-calculator.desktop

  # Add desktop entry into a main category 
  sed -i 's/Categories=Calculator;/Categories=Utility;Calculator;/' cutefish-calculator.desktop
  
}

build() {
  cmake -G Ninja -B build -S calculator-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
