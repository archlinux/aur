# Maintainer: David P. <megver83@parabola.nu>

_target=sh-elf
pkgname=$_target-newlib
pkgver=3.3.0
pkgrel=1
_upstream_ver=$pkgver
pkgdesc='A C standard library implementation intended for use on embedded systems (SuperH)'
arch=(any)
url='http://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc)
options=(!emptydirs !strip)
source=(https://sourceware.org/pub/newlib/newlib-$_upstream_ver.tar.gz)
sha256sums=('58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66')

build() {
  mkdir newlib-build

  export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections'
  cd "$srcdir"/newlib-build
  ../newlib-$_upstream_ver/configure \
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
  cd "$srcdir"/newlib-build
  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$_upstream_ver/COPYING*
}
