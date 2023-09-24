# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-picolibc
pkgver=1.8.4
pkgrel=1
pkgdesc='Fork of newlib with stdio bits from avrlibc'
conflicts=("$_target-newlib")
arch=('i686' 'x86_64')
url='https://github.com/picolibc/picolibc'
license=('BSD')
makedepends=("$_target-gcc" 'meson')
source=("picolibc-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f3532145f4bd25b050382627e392c0697645a6feb42f66ae5ad3db2e71d5947e')
options=(!strip !buildflags)

build() {
  meson \
    --prefix="/usr/$_target" \
    --buildtype=plain \
    --cross-file "picolibc-$pkgver/scripts/cross-${_target}.txt" \
    "picolibc-$pkgver" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/picolibc-$pkgver/COPYING."{GPL2,NEWLIB,picolibc}
}

# vim: set ts=2 sw=2 et:
