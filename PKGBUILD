# Based on freetype2 from extra
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-old-hinting
pkgname=('freetype2-old-hinting')
pkgver=2.10.0
pkgrel=2
pkgdesc="Font rasterization library (including the old hinting engine)"
arch=(i686 x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch
        0004-pcf-Fix-handling-of-undefined-glyph-56067.patch
        freetype2.sh)
sha1sums=('f6abf03e0e3189a0de883981c57d3861b5d314f5'
          'SKIP'
          '46fd67e6a594f6c2c473b9321ba64913984ba42f'
          '4bf0c0749db09878b918cc404300f0d3e9091607'
          'af76172be8135e74391b7ad1b82c2124ae0ad86c'
          '74d0ae26620a22c03002ecfffd7bd4c8130d6f6c'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
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
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype2
  make -k check
}

package_freetype2-old-hinting() {
  provides=('libfreetype.so' "freetype2=$pkgver-$pkgrel")
  conflicts=('freetype2')
  install=freetype2.install
  backup=('etc/profile.d/freetype2.sh')

  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dt "${pkgdir}/etc/profile.d" -m644 ../freetype2.sh
}

# vim:set ts=2 sw=2 et:
