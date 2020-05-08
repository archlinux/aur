# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>

_target=xtensa-esp32-elf
pkgname=$_target-newlib
pkgver=3.0.0
pkgrel=1
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

  # flags: https://github.com/espressif/esp-idf/blob/master/make/project.mk
  export CFLAGS_FOR_TARGET='-g -O2 -ffunction-sections -fdata-sections'
  cd "$srcdir"/build-newlib
  ../$_upstream_name-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --enable-newlib-long-time_t \
    --enable-newlib-nano-malloc \
    --disable-newlib-supplied-syscalls \
    --enable-newlib-reent-small \
    --enable-newlib-io-c99-formats \
    --enable-newlib-io-long-long \
    --enable-newlib-io-float \
    --enable-newlib-io-pos-args
  make

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  cd "$srcdir"/build-nano
  ../$_upstream_name-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --with-newlib \
    --enable-multilib \
    --disable-newlib-io-c99-formats \
    --disable-newlib-supplied-syscalls \
    --enable-newlib-nano-formatted-io \
    --enable-newlib-reent-small \
    --enable-target-optspace \
    --enable-newlib-long-time_t \
    --enable-newlib-nano-malloc
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

