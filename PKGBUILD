# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_target=xtensa-esp32-elf
pkgname=$_target-newlib
pkgver=3.0.0
pkgrel=2
_upstream_name=newlib-esp32
_upstream_ver=esp-2020r1
pkgdesc='A C standard library implementation intended for use on embedded systems (xtensa esp32 bare metal)'
arch=(x86_64)
url='https://github.com/espressif/newlib-esp32'
license=(GPL)
makedepends=($_target-gcc)
options=(!emptydirs !strip)
source=("$_upstream_name-$_upstream_ver.tar.gz::https://codeload.github.com/espressif/$_upstream_name/tar.gz/$_upstream_ver")
sha256sums=('c11651496bafd9394cb4b4658f455493c7da7cf128e84595b272a4072a64a5a9')

build() {
  rm -rf build-{newlib,nano}
  mkdir build-{newlib,nano}

  # flags: https://github.com/espressif/crosstool-NG
  export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections -mlongcalls'
  cd "$srcdir"/build-newlib
  ../$_upstream_name-$_upstream_ver/configure \
    --prefix=/usr \
    --target=$_target \
    --enable-newlib-atexit-dynamic-alloc \
    --enable-newlib-io-c99-formats \
    --enable-newlib-io-float \
    --enable-newlib-io-long-long \
    --enable-newlib-io-pos-args \
    --enable-newlib-long-time_t \
    --enable-newlib-multithread \
    --enable-newlib-nano-malloc \
    --enable-newlib-reent-small \
    --enable-newlib-unbuf-stream-opt \
    --enable-newlib-wide-orient \
    --enable-target-optspace \
    --disable-lite-exit \
    --disable-newlib-global-atexit \
    --disable-newlib-io-long-double \
    --disable-newlib-nano-formatted-io \
    --disable-newlib-register-fini \
    --disable-newlib-supplied-syscalls
  make

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -mlongcalls'
  cd "$srcdir"/build-nano
  ../$_upstream_name-$_upstream_ver/configure \
    --prefix=/usr \
    --target=$_target \
    --with-newlib \
    --enable-multilib \
    --enable-newlib-long-time_t \
    --enable-newlib-nano-formatted-io \
    --enable-newlib-nano-malloc \
    --enable-newlib-reent-small \
    --enable-target-optspace \
    --disable-newlib-io-c99-formats \
    --disable-newlib-supplied-syscalls
  make
}

package() {
  cd "$srcdir"/build-nano
  make DESTDIR="$pkgdir" install -j1
  find "$pkgdir" -regex ".*/lib\(c\|g\|rdimon\)\.a" -exec rename .a _nano.a '{}' \;
  install -d "$pkgdir"/usr/$_target/include/newlib-nano
  install -m644 -t "$pkgdir"/usr/$_target/include/newlib-nano "$pkgdir"/usr/$_target/include/newlib.h

  cd "$srcdir"/build-newlib
  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$_upstream_name-$_upstream_ver/COPYING*
}

