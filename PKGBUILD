# Maintainer: David P. <megver83@parabola.nu>

_target=sh-elf
pkgname=$_target-newlib
pkgver=3.0.0
pkgrel=1
_upstream_ver=$pkgver
pkgdesc="A C standard library implementation intended for use on embedded systems ($_target target)"
arch=(any)
url='http://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc)
options=(!emptydirs !strip)
source=(ftp://sourceware.org/pub/newlib/newlib-$_upstream_ver.tar.gz
        fix_build1.patch::'https://www.sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=patch;h=b8272e3b8df8337744423e4dd23e727cf963d528'
        fix_build2.patch::'https://www.sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=patch;h=b7e0f286a2ecab3b687ec9b3f95f5a88b9f85310')
sha256sums=('c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332'
            '2be98412600b8d62b4f1456e95ae4bc3b7a6810981d3fde49fad1f42df0c49da'
            '641978987fcfc9fc5c529192f34771db44d3257f95bc682da16e8351356177cf')

prepare() {
  cd newlib-$_upstream_ver
  patch -p1 < ../fix_build1.patch
  patch -p1 < ../fix_build2.patch
}

build() {
  rm -rf build-{newlib,nano}
  mkdir build-{newlib,nano}

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

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  cd "$srcdir"/build-nano
  ../newlib-$_upstream_ver/configure \
    --target=$_target \
    --prefix=/usr \
    --disable-newlib-supplied-syscalls \
    --disable-nls \
    --enable-newlib-reent-small           \
    --disable-newlib-fvwrite-in-streamio  \
    --disable-newlib-fseek-optimization   \
    --disable-newlib-wide-orient          \
    --enable-newlib-nano-malloc           \
    --disable-newlib-unbuf-stream-opt     \
    --enable-lite-exit                    \
    --enable-newlib-global-atexit         \
    --enable-newlib-nano-formatted-io
  make
}

package() {
  cd "$srcdir"/build-nano
  make DESTDIR="$pkgdir" install -j1
  find "$pkgdir" -regex ".*/lib\(c\|g\|rdimon\)\.a" -exec rename .a _nano.a '{}' \;

  cd "$srcdir"/build-newlib
  make DESTDIR="$pkgdir" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$_upstream_ver/COPYING*
}
