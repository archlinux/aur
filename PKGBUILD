# Maintainer: Natrio <natrio@list.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
pkgname=${_pkgname}-v35
pkgver=2.10.4
pkgrel=1
pkgdesc="Font rasterization library with v35 bytecode interpreter only"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
provides=('libfreetype.so' 'freetype2')
conflicts=('freetype2')
install=freetype2.install
backup=('etc/profile.d/freetype2.sh')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-v35-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        freetype2.sh)
sha256sums=('86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

prepare() {
  cd freetype-${pkgver}
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-v35-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
}

build() {
  cd freetype-${pkgver}
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype-${pkgver}
  make -k check
}

package() {
  cd freetype-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"
}
