# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>

_target=mips64-elf
pkgname=${_target}-newlib
pkgver=3.1.0
pkgrel=1
pkgdesc="A C library intended for use on embedded systems (${_target})"
arch=('any')
url='http://sourceware.org/newlib/'
license=('BSD')
makedepends=("${_target}-gcc-stage1")
options=( '!strip' '!emptydirs')
source=("ftp://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz")
sha256sums=('fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a')

build()
{
  rm -rf build
  mkdir build && cd build

  export CFLAGS_FOR_TARGET='-G0 -O2 -ffunction-sections -fdata-sections -fomit-frame-pointer'

  ../newlib-${pkgver}/configure \
    --prefix=/usr \
    --target=${_target} \
    --enable-lto \
    --enable-multilib \
    --disable-libssp \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-werror

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

