# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-picolibc
pkgver=1.7.1
pkgrel=1
pkgdesc='Fork of newlib with stdio bits from avrlibc'
conflicts=("$_target-newlib")
arch=('i686' 'x86_64')
url='https://github.com/picolibc/picolibc'
license=('BSD')
makedepends=("$_target-gcc" 'meson')
source=("picolibc-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('326b0f692eda730fb66b7f73491310e2b6e2df5eda0aaa7a1ebcaac40a1c1947')
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
