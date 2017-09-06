# Based on lib32-freetype2 from multilib
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=freetype2
pkgname=lib32-$_pkgbasename-old-hinting
pkgver=2.8
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
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch)
sha1sums=('42c6b1f733fe13a3eba135f5025b22cb68450f91'
          'SKIP'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          'b1494810ed3aca25cdd8e8cedf634e5adfe6c09e'
          '41d27140fd590945e22e012c9dce62de3d6f11e6'
          '334f229875039794adeb574e27d365bb445fb314')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch

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

  rm -r "${pkgdir}"/usr/{include,share,bin}
}
