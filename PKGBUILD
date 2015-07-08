# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=mingw-w64-freetype2-minimal
pkgver=2.8
pkgrel=1
pkgdesc='Font rasterization library (without harfbuzz) (mingw-w64)'
arch=('any')
url='https://www.freetype.org/'
license=('GPL')
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2)
makedepends=(mingw-w64-gcc mingw-w64-configure)
provides=(mingw-w64-freetype mingw-w64-freetype2 mingw-w64-freetype2-bootstrap)
conflicts=(mingw-w64-freetype mingw-w64-freetype2 mingw-w64-freetype2-bootstrap)
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch)
options=(!strip !buildflags !libtool staticlibs)
sha1sums=('42c6b1f733fe13a3eba135f5025b22cb68450f91'
          'SKIP'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          'b1494810ed3aca25cdd8e8cedf634e5adfe6c09e'
          '41d27140fd590945e22e012c9dce62de3d6f11e6'
          '334f229875039794adeb574e27d365bb445fb314')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "${srcdir}/freetype-${pkgver}"

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/freetype-${pkgver}/build-${_arch}"
    cd "${srcdir}/freetype-${pkgver}/build-${_arch}"
    ${_arch}-configure --with-zlib=/usr/${_arch} --without-png --without-harfbuzz
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

