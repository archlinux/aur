# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=riscv-none-elf
pkgname=$_target-newlib
pkgver=4.5.0.20241231
pkgrel=1
pkgdesc='A C standard library implementation intended for use on embedded systems (RISC-V bare metal)'
arch=(any)
url='https://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc-stage1)
options=(!emptydirs !strip)
source=(https://sourceware.org/pub/newlib/newlib-$pkgver.tar.gz)
sha512sums=('d391ea3ac68ddb722909ef790f81ba4d6c35d9b2e0fcdb029f91a6c47db9ee94a686a2bdff211fb84025e1a317e257acfa59abda3fd2bc6609966798e1c604dc')

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
