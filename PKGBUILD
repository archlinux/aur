# Maintainer: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-picolibc
pkgver=1.0.55
pkgrel=1
pkgdesc='Fork of newlib with stdio bits from avrlibc'
arch=('i686' 'x86_64')
url='https://github.com/keith-packard/picolibc'
license=('BSD')
depends=("$_target-gcc")
makedepends=('git' 'meson')
source=('git+https://github.com/keith-packard/picolibc.git')
sha1sums=('SKIP')
options=(!strip)

pkgver() {
  cd "$srcdir/picolibc"
  local ver="$(git describe --tags)"
  ver="${ver%-*}"
  ver="${ver#v}"
  echo "${ver/-/.}"
}

build() {
  mkdir build
  cd build

  meson ../picolibc \
    -Dincludedir=picolibc/$_target/include \
    -Dlibdir=picolibc/$_target/lib \
    --cross-file ../picolibc/cross-${_target}.txt

  ninja
}

package() {
  cd build

  DESTDIR="$pkgdir" ninja install
}

# vim: set ts=2 sw=2 et:
