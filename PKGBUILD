# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-statusbar
pkgver=0.7
pkgrel=3
pkgdesc="Top status bar of CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/statusbar"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/statusbar/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'fix-build.patch')
sha512sums=('d1f54e9e0da3ee3219abf7ecea84e285ba3333919a8017ba4bc1c355fe50fbc00aaa5056eb338acd8d56b4cd7ec7fd09812f674d2f15d5ac196beb490cc0733f'
            'a44cb33d8f2f40a3e8f20464578b59c8405851668ce1f1d32f3503e7e6ba984ec8ecef4021393593ce68988b355c7fda7ec9c65f582e76ce74715db49d6d3cc9')

prepare() {
  cd statusbar-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Disable layer effect when the Qt Quick software backend is used
  sed -i 's/layer\.enabled: true/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software/' qml/*.qml
}

build() {
  cmake -G Ninja -B build -S statusbar-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
