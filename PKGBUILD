# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-terminal
pkgver=0.7
pkgrel=2
pkgdesc="A terminal emulator for Cutefish"
arch=('x86_64')
url="https://github.com/cutefishos/terminal"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/terminal/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'fix-build.patch')
sha512sums=('2378e96dc600c534f66ffa1c50ee7e7aabbdf84dd575134bd2cd3f091d32c5d2aa5fd426abfe4857a6851920b677b80e74a025e30d67b527c2b23b7109c219df'
            'a44cb33d8f2f40a3e8f20464578b59c8405851668ce1f1d32f3503e7e6ba984ec8ecef4021393593ce68988b355c7fda7ec9c65f582e76ce74715db49d6d3cc9')

prepare() {
  cd terminal-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Fix window icon name
  sed -i 's/QIcon::fromTheme("terminal")/QIcon::fromTheme("utilities-terminal")/' src/main.cpp
}

build() {
  cmake -G Ninja -B build -S terminal-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
