# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-freetype2
pkgver=2.11.0
pkgrel=1
pkgdesc='Font rasterization library (mingw-w64)'
arch=('any')
url='https://www.freetype.org/'
license=('GPL')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2 mingw-w64-brotli)
makedepends=(mingw-w64-gcc mingw-w64-meson)
provides=(mingw-w64-freetype)
replaces=(mingw-w64-freetype)
conflicts=(mingw-w64-freetype)
options=(!strip !buildflags !libtool staticlibs)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0006-Return_FT_Err_Ok_while_trying_to_render_bitmap.patch
        0007-Restore_quiet_no-op_rendering_of_bitmap_glyphs.patch)
sha256sums=('8bee39bd3968c4804b70614a0a3ad597299ad0e824bc8aad5ce8aaf48067bde7'
            'SKIP'
            'e606bdba5c0ee698902886140e4643551ffc8327b1b7d2b0c9129d1f93b1f36c'
            '17ab1609cdbcaba3c5975f5cf1ffd078e067d560f906d5507390d41997e6c468'
            '561d2f2503d180b796f868470612610f6d7fcb34efa0620ecab38fd39002e27a'
            '9c068a984e7b9a27ff9e709839d522b66815ac4e8c7a5bd4ea0224335f7f2ef6'
            '2b13b8cc9acc3e56be6b0f8102d648864227bf93637bc956d5052c77c8509782'
            '21a2d243bc6b44d1cdb88ef29af2bd5ceda8d0faaf928bdc2c078a474ddc61f1')
validpgpkeys=(58E0C111E39F5408C5D3EC76C1A60EACE707FDA5) # Werner Lemberg <wl@gnu.org>

if [[ $pkgname = 'mingw-w64-freetype2-bootstrap' ]]; then
  _provides=${pkgname%-bootstrap}
else
  _provides=${pkgname}-bootstrap
  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  depends+=(mingw-w64-harfbuzz)
  replaces+=(${_provides})
fi
provides+=(${_provides})
conflicts+=(${_provides})

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/freetype-${pkgver}"

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  # https://gitlab.freedesktop.org/freetype/freetype/-/issues/1076
  patch -Np1 -i ../0006-Return_FT_Err_Ok_while_trying_to_render_bitmap.patch
  patch -Np1 -i ../0007-Restore_quiet_no-op_rendering_of_bitmap_glyphs.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/freetype-${pkgver}/build-${_arch}"
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    ${_arch}-meson --default-library both -D zlib=enabled -D bzip2=enabled -D png=disabled -D brotli=enabled
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-ranlib "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
