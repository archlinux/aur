#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

_target=mips64-elf
pkgname=${_target}-newlib
pkgver=2.5.0
pkgrel=1
pkgdesc="A C library intended for use on embedded systems (${_target})"
arch=('any')
url='http://sourceware.org/newlib/'
license=('BSD')
makedepends=("${_target}-gcc-stage1")
options=( '!strip' '!emptydirs')
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz")
sha256sums=('5b76a9b97c9464209772ed25ce55181a7bb144a66e5669aaec945aa64da3189b')

build()
{
  rm -rf build
  mkdir build && cd build

  export CFLAGS_FOR_TARGET='-G0 -O2 -ffunction-sections -fdata-sections'

  ../newlib-${pkgver}/configure \
    --prefix=/usr \
    --target=${_target} \
    --enable-lto \
    --disable-libssp \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-werror \

  make
}

package()
{
  cd build
  make DESTDIR="${pkgdir}" install -j1

  find "$pkgdir"/usr/$_target/lib \( -name "*.a" -or -name "*.o" \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/newlib-$pkgver/COPYING*
}

