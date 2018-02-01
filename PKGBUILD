# Maintainer: Natrio <natrio@list.ru>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
_pkgbasename=${_pkgname}-v35
pkgname=lib32-${_pkgbasename}
pkgver=2.9
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
source=(https://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-v35-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0001-psaux-Correctly-handle-Flex-features-52846.patch
)
sha1sums=('94c4399b1a55c5892812e732843fcb4a7c2fe657'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          'b1494810ed3aca25cdd8e8cedf634e5adfe6c09e'
          '5237bd234d7bb359dadb28e804115f07bbbdfb13'
          '334f229875039794adeb574e27d365bb445fb314'
          '21ad7dd31e16adb5b39adfa5671018a736626562'
)

prepare() {
  cd freetype-${pkgver}
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-v35-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  # Freetype 2.9 regression: bad rendering for some Type 1 fonts
  # https://savannah.nongnu.org/bugs/?52846
  patch -Np1 -i ../0001-psaux-Correctly-handle-Flex-features-52846.patch
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
  rm -r "${pkgdir}"/usr/{include,share,bin}
}
