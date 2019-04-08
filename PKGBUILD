# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=mingw-w64-freetype2-bootstrap
pkgver=2.10.0
pkgrel=1
pkgdesc='Font rasterization library (mingw-w64)'
arch=('any')
url='https://www.freetype.org/'
license=('GPL')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2)
makedepends=(mingw-w64-gcc mingw-w64-configure)
provides=(mingw-w64-freetype)
replaces=(mingw-w64-freetype)
conflicts=(mingw-w64-freetype)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-infinality-subpixel-hinting.patch
        0003-Enable-long-PCF-family-names.patch)
options=(!strip !buildflags !libtool staticlibs)
sha1sums=('f6abf03e0e3189a0de883981c57d3861b5d314f5'
          'SKIP'
          '46fd67e6a594f6c2c473b9321ba64913984ba42f'
          '4bf0c0749db09878b918cc404300f0d3e9091607'
          'af76172be8135e74391b7ad1b82c2124ae0ad86c')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

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
  patch -Np1 -i ../0002-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
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
