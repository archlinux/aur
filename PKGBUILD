# Maintainer: Martchus <martchus@gmx.net>
pkgname=mingw-w64-freetype2-bootstrap
pkgver=2.6.2
pkgrel=2
pkgdesc="TrueType font rendering library (mingw-w64 bootstrap)"
arch=('any')
url="http://www.freetype.org/"
license=('GPL')
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(mingw-w64-crt mingw-w64-zlib mingw-w64-bzip2)
makedepends=(mingw-w64-gcc mingw-w64-configure)
provides=(mingw-w64-freetype ${pkgname%-bootstrap})
conflicts=(mingw-w64-freetype ${pkgname%-bootstrap})
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-subpixel-hinting.patch
        0004-Mask-subpixel-hinting-with-an-env-var.patch)
options=(!strip !buildflags !libtool staticlibs)
sha1sums=('29c22b85b77cb22cf95c13e7062e21f39fe6b17a'
          'SKIP'
          '1c7bc438df0428a63f881e7e4343b22c5b09ecb1'
          'e2d2b8c4847ab9cfd497179c7140835e99ece711'
          'ebe3d7a6fc41304a77c23cb56e94dc718146d963'
          'f50c70080f3fbee45b9c4264d8ae37eb4f1ac335')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/freetype-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-Enable-table-validation-modules.patch"
  patch -Np1 -i "${srcdir}/0002-Enable-subpixel-rendering.patch"

  # https://bugs.archlinux.org/task/35274
  patch -Np1 -i "${srcdir}/0003-Enable-subpixel-hinting.patch"
  # Provide a way to enable the above patch at runtime.
  # Hopefully just a temporary measure until fontconfig picks up
  # the necessary configurables.
  patch -Np1 -i "${srcdir}/0004-Mask-subpixel-hinting-with-an-env-var.patch"
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
