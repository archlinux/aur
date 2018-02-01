# Maintainer: Natrio <natrio@list.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
pkgname=${_pkgname}-v35
pkgver=2.9
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
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-v35-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        0001-psaux-Correctly-handle-Flex-features-52846.patch
        freetype2.sh)
sha1sums=('94c4399b1a55c5892812e732843fcb4a7c2fe657'
          'c3e91e668936206d3c158bffde0f69788a086a5b'
          '4ff958229a7f87e04a9894d5a6ed2df227071931'
          '5237bd234d7bb359dadb28e804115f07bbbdfb13'
          '334f229875039794adeb574e27d365bb445fb314'
          '21ad7dd31e16adb5b39adfa5671018a736626562'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')

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
