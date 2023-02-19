# Maintainer: Natrio <natrio@list.ru>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
_pkgbasename=${_pkgname}-v35
pkgname=lib32-${_pkgbasename}
pkgver=2.13.0
pkgrel=1
pkgdesc="TrueType font rendering library with v35 bytecode interpreter only"
arch=(x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('lib32-brotli' 'lib32-zlib' 'lib32-bzip2' 'lib32-libpng' 'lib32-harfbuzz' $_pkgbasename)
makedepends=('gcc-multilib')
provides=('libfreetype.so' lib32-${_pkgname}=${pkgver})
conflicts=(lib32-${_pkgname})
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-v35-subpixel-hinting.patch
  0004-Enable-long-PCF-family-names.patch
)
sha256sums=('5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c'
 SKIP SKIP SKIP SKIP
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
