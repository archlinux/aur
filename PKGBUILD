# Maintainer: Joey Dumont <joey.dumont@gmail.com>
_target=mips64-ultra-elf
pkgname=${_target}-newlib
_newlibver=3.3.0
pkgver=3.3.0_r134.54b8f95
pkgrel=1
pkgdesc="A C library intended for use on embedded systems (${_target})"
arch=('x86_64')
url='http://sourceware.org/newlib/'
license=('BSD')
makedepends=("${_target}-gcc-stage1" "git")
options=( '!strip' '!emptydirs')
source=("ftp://sourceware.org/pub/newlib/newlib-${_newlibver}.tar.gz"
        "git+https://github.com/glankk/n64.git#branch=n64-ultra")
sha256sums=('58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66'
            'SKIP')

pkgver() {
  cd ${srcdir}/n64/
  printf "%s_r%s.%s" "${_newlibver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Apply the patch.
  patch -d ${srcdir}/newlib-${_newlibver} -p 1 < ${srcdir}/n64/config/newlib/newlib.diff
}

build()
{
  rm -rf build
  mkdir build && cd build

  export CFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"
  export CXXFLAGS_FOR_TARGET="-Os -g -ffunction-sections -fdata-sections"

  ../newlib-${_newlibver}/configure \
    --prefix=/usr \
    --target=${_target} \
    --with-newlib \
    --enable-newlib-global-atexit \
    --disable-newlib-fvwrite-in-streamio \
    --disable-newlib-wide-orient \
    --disable-newlib-unbuf-stream-opt \
    --disable-newlib-supplied-syscalls \
    --enable-lite-exit \
    --enable-lto \
    --disable-libssp \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-werror \
    --enable-multilib

  make
}

package()
{
  cd build
  make DESTDIR="${pkgdir}" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$_newlibver/COPYING*
}
