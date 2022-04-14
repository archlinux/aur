# Maintainer: Rafael Silva (perigoso) <perigoso@riseup.net>

_target=ft32-elf
pkgname=$_target-newlib
pkgver=2.5.0
pkgrel=2
_upstream_ver=$pkgver
pkgdesc='A C standard library implementation intended for use on embedded systems (Bridgetek FT9xx bare-metal)'
arch=(any)
url='https://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc)
options=(!emptydirs !strip)
source=("https://sourceware.org/pub/newlib/newlib-$_upstream_ver.tar.gz"
		'libstub.a')
noextract=('libstub.a')
sha512sums=('4c99e8dfcb4a7ad0769b9e173ff06628d82e4993ef87d3adf9d6b5578626b14de81b4b3c5f0673ddbb49dc9f3d3628f9f8d4432dcded91f5cd3d27b7d44343cd'
            '8775bf081d632676f28d1ba768d88bbd4a88e2cc03bcb84408d47a7f66c0a9b1aacf0532a93fd979657a0cf6f5de677c68f1c3dd272b4c616f9905625f40e448')

build() {
  rm -rf build-newlib
  mkdir build-newlib

  cd "$srcdir"/build-newlib

  export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections'
  ../newlib-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --disable-newlib-supplied-syscalls \
    --enable-newlib-reent-small \
    --disable-newlib-fseek-optimization \
    --disable-newlib-wide-orient \
    --enable-newlib-nano-malloc \
    --disable-newlib-unbuf-stream-opt \
    --disable-newlib-fvwrite-in-streamio \
	--enable-newlib-retargetable-locking \
    --enable-lite-exit \
    --enable-newlib-global-atexit \
    --disable-nls

  make
}

package() {
  cd "$srcdir"/build-newlib

  make DESTDIR="$pkgdir" install -j1

  install "$srcdir"/libstub.a "$pkgdir"/usr/$_target/lib

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
       -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
       -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$_upstream_ver/COPYING*
}
