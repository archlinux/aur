# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgname=freetype2
pkgname=${_pkgname}-v35
pkgver=2.8
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
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        https://download-mirror.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-v35-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        freetype2.sh)
sha1sums=('42c6b1f733fe13a3eba135f5025b22cb68450f91'
          'SKIP'
          '5b221ee14fe674cd5f6db0193d55360bc0bd3655'
          'SKIP'
          'c3e91e668936206d3c158bffde0f69788a086a5b'
          '4ff958229a7f87e04a9894d5a6ed2df227071931'
          '5237bd234d7bb359dadb28e804115f07bbbdfb13'
          '334f229875039794adeb574e27d365bb445fb314'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-v35-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype2
  make -k check
}

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -d "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/freetype2"
}

# vim:set ts=2 sw=2 et:
