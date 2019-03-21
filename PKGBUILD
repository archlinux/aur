# Maintainer: Natrio <natrio@list.ru>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
_pkgbasename=${_pkgname}-v35
pkgname=lib32-${_pkgbasename}
pkgver=2.10.0
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
)
sha1sums=('f6abf03e0e3189a0de883981c57d3861b5d314f5'
          '46fd67e6a594f6c2c473b9321ba64913984ba42f'
          '57b1671593684712a555ac5a42bf22f2b85dbe1b'
          '8b7911d96f9854ee139b82a88c1ba634e11873ec'
          'af76172be8135e74391b7ad1b82c2124ae0ad86c'
)

prepare() {
  cd freetype-${pkgver}
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-v35-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
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
