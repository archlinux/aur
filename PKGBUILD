# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

# Contributor: SummerBreeze630 <xzwf2003@163.com>

# port from Arch Linux AUR repository riscv64-elf-newlib
_target=riscv64-unknown-elf
pkgname=$_target-newlib
pkgver=4.6.0.20260123
pkgrel=1
_upstream_ver=$pkgver
pkgdesc='A C standard library implementation intended for use on embedded systems (RISCV64 bare metal)'
arch=(any)
url='https://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc)
conflicts=("$_target-picolib")
options=(!emptydirs !strip)
source=(https://sourceware.org/pub/newlib/newlib-$_upstream_ver.tar.gz)
sha256sums=('6ff27e3bf022666f43f7802255be680eeff722ac181b1725d21e2e8318604ee3')

build() {
  rm -rf build-{newlib,nano}
  mkdir build-{newlib,nano}

  cd "$srcdir"/build-newlib

  export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections'
  ../newlib-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --enable-newlib-io-long-long \
    --enable-newlib-io-c99-formats \
    --enable-newlib-register-fini \
    --enable-newlib-retargetable-locking \
    --disable-newlib-supplied-syscalls \
    --disable-nls
  make -j$(nproc)

  cd "$srcdir"/build-nano

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  ../newlib-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --disable-newlib-supplied-syscalls \
    --enable-newlib-reent-small \
    --enable-newlib-retargetable-locking \
    --disable-newlib-fvwrite-in-streamio \
    --disable-newlib-fseek-optimization \
    --disable-newlib-wide-orient \
    --enable-newlib-nano-malloc \
    --disable-newlib-unbuf-stream-opt \
    --enable-lite-exit \
    --enable-newlib-global-atexit \
    --enable-newlib-nano-formatted-io \
    --disable-nls
  make -j$(nproc)
}

package() {
  cd "$srcdir"/build-nano

  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir" -regex ".*/lib\(c\|g\|m\|rdimon\|gloss\)\.a" -exec rename .a _nano.a '{}' \;
  install -d "$pkgdir"/usr/$_target/include/newlib-nano
  install -m644 -t "$pkgdir"/usr/$_target/include/newlib-nano "$pkgdir"/usr/$_target/include/newlib.h

  cd "$srcdir"/build-newlib

  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
       -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
       -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$_upstream_ver/COPYING*

  # https://gitlab.archlinux.org/archlinux/packaging/packages/riscv64-elf-newlib/-/issues/1
  rm "${pkgdir}/usr/share/info/porting.info"
}
