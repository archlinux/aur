# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-screenshot
pkgver=0.8
pkgrel=3
pkgdesc="Screenshot tool for CutefishOS"
arch=('x86_64')
url="https://github.com/cutefishos/screenshot"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/screenshot/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'fix-build.patch'
        '0001-Use-common-icon-name.patch')
sha512sums=('e664f67987390b7be018102a552d66a87184aa7d8ceedde425e3f0beb7b952ce66d4b9fe10031816e0cf222d7755469bda78ecb112c68a74e719aef3f11f3050'
            'a44cb33d8f2f40a3e8f20464578b59c8405851668ce1f1d32f3503e7e6ba984ec8ecef4021393593ce68988b355c7fda7ec9c65f582e76ce74715db49d6d3cc9'
            '10d67343748790c897ddb0211ed714bd4bf0733bfea1dae7f3e5556c6372a7bef698be5cd67bded93e97c1c3c1321636fca2c82dec2b7a5a342815bda26fcf7a')

prepare() {
  cd screenshot-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Use common icon name
  patch -p1 -i ../0001-Use-common-icon-name.patch

  # Fix desktop entry category
  sed -i 's/Settings;/Utility;/' cutefish-screenshot.desktop
}

build() {
  cmake -G Ninja -B build -S screenshot-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
