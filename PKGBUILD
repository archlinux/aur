# Based on lib32-freetype2 from multilib
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=freetype2
pkgname=lib32-$_pkgbasename-old-hinting
pkgver=2.9.1
pkgrel=1
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
        0003-Enable-long-PCF-family-names.patch)
sha1sums=('220c82062171c513e4017c523d196933c9de4a7d'
          'SKIP'
          'd9eb22e5c962923089b0c9fc5491cf28a19bd982'
          'd13503902e0404cf3558db76b477f23f9910d06e'
          'fc49742fb6c19fe0677e3552bb7c00aac8530265')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch

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
