# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=riscv-none-elf
pkgname=$_target-newlib
pkgver=4.4.0.20231231
pkgrel=3
pkgdesc='A C standard library implementation intended for use on embedded systems (RISC-V bare metal)'
arch=(any)
url='https://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc-stage1)
options=(!emptydirs !strip)
source=(https://sourceware.org/pub/newlib/newlib-$pkgver.tar.gz)
sha256sums=('0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13')

build() {
  mkdir build-newlib

  export CFLAGS_FOR_TARGET='-g -Oz -ffunction-sections -fdata-sections -pipe'
  cd "$srcdir"/build-newlib
  ../newlib-$pkgver/configure \
    --target=$_target \
    --prefix=/usr \
    --enable-newlib-io-long-long \
    --enable-newlib-io-c99-formats \
    --enable-newlib-register-fini \
    --enable-newlib-retargetable-locking \
    --disable-newlib-supplied-syscalls \
    --disable-nls
  make
}

package() {
  cd "$srcdir"/build-newlib
  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$pkgver/COPYING*
}
