# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-freetype2
pkgver=2.6.5
pkgrel=1
pkgdesc="TrueType font rendering library (mingw-w64)"
arch=('any')
url="http://www.freetype.org/"
license=('GPL')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2)
makedepends=(mingw-w64-gcc mingw-w64-configure)
provides=(mingw-w64-freetype)
replaces=(mingw-w64-freetype)
conflicts=(mingw-w64-freetype)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Make-subpixel-hinting-mode-configurable.patch
        0004-Keep-default-interpreter-version-as-35.patch)
options=(!strip !buildflags !libtool staticlibs)
sha1sums=('5db38ae2308c5a2c519c8e071e98b70d61585201'
          'SKIP'
          'e1fde7854d2a64868a5eef07415ad23c339fc630'
          '7da3af8e1e002e39a247c37a05a10beb576007d6'
          'c64ba9d37732fc75de7817d1d679a3e38efdb4cb'
          '1f30feeba9c51c9ec745bd29ef07beccf9544338')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

if [[ $pkgname = "mingw-w64-freetype2-bootstrap" ]]; then
  _provides=${pkgname%-bootstrap}
else
  _provides=${pkgname}-bootstrap
  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  depends+=(mingw-w64-harfbuzz)
fi
provides+=(${_provides})
replaces+=(${_provides})
conflicts+=(${_provides})

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/freetype-${pkgver}"
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch

  # Provide a way to set the default subpixel hinting mode
  # at runtime, without depending on the application to do so.
  patch -Np1 -i ../0003-Make-subpixel-hinting-mode-configurable.patch

  # Keep the classic subpixel hinting mode as default, as expected
  # by upstream for the 2.6 series
  patch -Np1 -i ../0004-Keep-default-interpreter-version-as-35.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/freetype-${pkgver}/build-${_arch}"
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    ${_arch}-configure --with-zlib=/usr/${_arch} --without-png
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
