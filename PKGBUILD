# Maintainer: swiftgeek

_target=aarch64-linux-gnu
pkgname=$_target-picolibc
pkgver=1.8.8
pkgrel=1
pkgdesc='Fork of newlib with stdio bits from avrlibc'
arch=('i686' 'x86_64')
url='https://github.com/picolibc/picolibc'
license=('BSD')
makedepends=("$_target-gcc" 'meson')
source=("picolibc-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b7acd0094b3c2c265e0f41bfa9d29ab85a47e1a02d65cf4929b1886158e8c261')
options=(!strip !buildflags)

# Check crosstool-ng for reliable/recent meson options to use
# Do not set `system-libc` as glibc is already the default one!
# `lib64` path comes from `aarch64-linux-gnu-gcc -print-multi-os-directory`
build() {
  meson setup \
    --prefix="/usr/$_target"/picolibc/ \
    --cross-file "picolibc-$pkgver/scripts/cross-${_target}.txt" \
    -Dlibdir="lib64" -Dspecsdir="/usr/$_target/lib/" \
    -Dmultilib=false -Dio-c99-formats=true -Dio-long-long=false \
    -Dnewlib-register-fini=false -Dnewlib-nano-malloc=true \
    -Dnewlib-atexit-dynamic-alloc=false -Dnewlib-global-atexit=false \
    -Dlite-exit=true -Dnewlib-multithread=true \
    -Dnewlib-retargetable-locking=true -Dsystem-libc=false \
    "picolibc-$pkgver" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/picolibc-$pkgver/COPYING."{GPL2,NEWLIB,picolibc}
}

# vim: set ts=2 sw=2 et:
