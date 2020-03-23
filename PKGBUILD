# Maintainer: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-newlib
pkgver=3.3.0
pkgrel=1
pkgdesc='A C standard library implementation intended for use on embedded systems (microcontrollers)'
arch=('any')
url='https://www.sourceware.org/newlib/'
license=('BSD')
makedepends=("$_target-gcc")
options=(!emptydirs !strip)
source=("https://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz")
sha256sums=('58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66')

build() {
  mkdir build-{newlib,nano}

  cd "$srcdir/build-newlib"
  ../newlib-$pkgver/configure \
    CFLAGS_FOR_TARGET='-g -O2 -mcmodel=medany -ffunction-sections -fdata-sections' \
    --target=$_target \
    --prefix=/usr \
    --enable-newlib-io-long-long \
    --enable-newlib-io-c99-formats \
    --enable-newlib-register-fini \
    --enable-newlib-retargetable-locking \
    --disable-newlib-supplied-syscalls \
    --disable-nls
  make

  cd "$srcdir/build-nano"
  ../newlib-$pkgver/configure \
    CFLAGS_FOR_TARGET='-g -Os -mcmodel=medlow -ffunction-sections -fdata-sections' \
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
  make
}

package() {
  local file

  cd "$srcdir/build-nano"
  make -j1 DESTDIR="$pkgdir" install

  while read -r file; do
    mv "$file" "${file%.a}_nano.a"
  done < <(exec find "$pkgdir" -name libc.a -or -name libg.a -or -name libgloss.a)

  install -dm755 "$pkgdir/usr/$_target/include/newlib-nano"
  install -m644 "$pkgdir/usr/$_target/include/newlib.h" \
    "$pkgdir/usr/$_target/include/newlib-nano/"

  cd "$srcdir/build-newlib"
  make -j1 DESTDIR="$pkgdir" install

  find "$pkgdir/usr/$_target/lib" \( -name '*.a' -or -name '*.o' \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir"/newlib-$pkgver/COPYING* \
    "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim: set ts=2 sw=2 et:
