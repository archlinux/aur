# Maintainer: David P. <megver83@parabola.nu>

_target=sh-elf
pkgname=$_target-newlib
pkgver=3.0.0.20180226
pkgrel=1
_upstream_ver=$pkgver
pkgdesc="A C standard library implementation intended for use on embedded systems (SuperH)"
arch=(any)
url='http://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc)
options=(!emptydirs !strip)
source=(ftp://sourceware.org/pub/newlib/newlib-$_upstream_ver.tar.gz)
sha256sums=('d0b40c874c3047eccbf06fe916d3fc746bd94e8a4cd14c54381b2f72f68c5665')

build() {
  rm -rf build-newlib
  mkdir build-newlib

  export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections'
  cd "$srcdir"/build-newlib
  ../newlib-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --disable-newlib-supplied-syscalls \
    --disable-nls \
    --enable-newlib-io-long-long \
    --enable-newlib-register-fini
  make

}

package() {
  cd "$srcdir"/build-newlib
  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$_upstream_ver/COPYING*
}
