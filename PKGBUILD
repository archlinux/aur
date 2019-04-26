# Based on lib32-freetype2 from multilib
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=freetype2
pkgname=lib32-$_pkgbasename-old-hinting
pkgver=2.10.0
pkgrel=2
pkgdesc="TrueType font rendering library (including the old hinting engine; 32-bit)"
arch=(x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('lib32-zlib' 'lib32-bzip2' 'lib32-libpng' 'lib32-harfbuzz' $_pkgbasename)
makedepends=('gcc-multilib')
provides=('libfreetype.so' "lib32-$_pkgbasename=$pkgver-$pkgrel")
conflicts=("lib32-$_pkgbasename")
source=(https://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        0004-pcf-Fix-handling-of-undefined-glyph-56067.patch)
sha1sums=('f6abf03e0e3189a0de883981c57d3861b5d314f5'
          'SKIP'
          '46fd67e6a594f6c2c473b9321ba64913984ba42f'
          '4bf0c0749db09878b918cc404300f0d3e9091607'
          'af76172be8135e74391b7ad1b82c2124ae0ad86c'
          '74d0ae26620a22c03002ecfffd7bd4c8130d6f6c')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch

  # https://bugs.archlinux.org/task/62395
  patch -Np1 -i ../0004-pcf-Fix-handling-of-undefined-glyph-56067.patch

  sed -ri 's|/\* +(#define +CFF_CONFIG_OPTION_OLD_ENGINE) +\*/|\1|' include/freetype/config/ftoption.h
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd freetype2
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  make
}

check() {
  cd freetype2
  make -k check
}

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/{include,share}
}

# vim:set ts=2 sw=2 et:
