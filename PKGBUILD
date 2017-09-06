# Based on freetype2 from extra
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=freetype2-old-hinting
pkgname=('freetype2-old-hinting')
pkgver=2.8
pkgrel=2
pkgdesc="Font rasterization library (including the old hinting engine)"
arch=(i686 x86_64)
license=('GPL')
url="https://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
source=(https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        https://download-mirror.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch
        freetype2.sh)
sha1sums=('42c6b1f733fe13a3eba135f5025b22cb68450f91'
          'SKIP'
          '5b221ee14fe674cd5f6db0193d55360bc0bd3655'
          'SKIP'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          'b1494810ed3aca25cdd8e8cedf634e5adfe6c09e'
          '41d27140fd590945e22e012c9dce62de3d6f11e6'
          '334f229875039794adeb574e27d365bb445fb314'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch

  sed -ri 's|/\* +(#define +CFF_CONFIG_OPTION_OLD_ENGINE) +\*/|\1|' include/freetype/config/ftoption.h
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

package_freetype2-old-hinting() {
  provides=('libfreetype.so' "freetype2=$pkgver-$pkgrel")
  conflicts=('freetype2')
  install=freetype2.install
  backup=('etc/profile.d/freetype2.sh')

  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"

  # Package docs
  install -d "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/freetype2"
}

# vim:set ts=2 sw=2 et:
