# Maintainer: Natrio <natrio@list.ru>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
_pkgbasename=${_pkgname}-v35
pkgname=lib32-${_pkgbasename}
pkgver=2.11.0
pkgrel=1
pkgdesc="TrueType font rendering library with v35 bytecode interpreter only"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('lib32-zlib' 'lib32-bzip2' 'lib32-libpng' 'lib32-harfbuzz' $_pkgbasename)
makedepends=('gcc-multilib')
provides=('libfreetype.so' lib32-${_pkgname}=${pkgver})
conflicts=(lib32-${_pkgname})
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-v35-subpixel-hinting.patch
  0004-Enable-long-PCF-family-names.patch
  0006-Return_FT_Err_Ok_while_trying_to_render_bitmap.patch
  0007-Restore_quiet_no-op_rendering_of_bitmap_glyphs.patch
  0008-sfnt-Add-API-for-retrieving-a-COLR-v1-ClipBox-table.patch
  0009-src-sfnt-ttcolr.c-tt_face_get_color_glyph_clipbox-Mi.patch
  0010-sfnt-Add-missing-blend-mode-plus-to-COLR-v1.patch
)
sha256sums=('8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7'
 SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
)

prepare() {
  cd freetype-${pkgver}
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-v35-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0006-Return_FT_Err_Ok_while_trying_to_render_bitmap.patch
  patch -Np1 -i ../0007-Restore_quiet_no-op_rendering_of_bitmap_glyphs.patch
  patch -Np1 -i ../0008-sfnt-Add-API-for-retrieving-a-COLR-v1-ClipBox-table.patch
  patch -Np1 -i ../0009-src-sfnt-ttcolr.c-tt_face_get_color_glyph_clipbox-Mi.patch
  patch -Np1 -i ../0010-sfnt-Add-missing-blend-mode-plus-to-COLR-v1.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd freetype-${pkgver}
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32
  make
}

check() {
  cd freetype-${pkgver}
  make -k check
}

package() {
  cd freetype-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{include,share}
}
