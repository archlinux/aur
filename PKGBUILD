# Based on freetype2 from extra repo
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Jan de Groot <jgc@archlinux.org>

_origpkgname=freetype2
pkgname=$_origpkgname-old-hinting
pkgver=2.7
pkgrel=2
pkgdesc="TrueType font rendering library (including old hinting engine)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
optdepends=('libx11: Some demo programs')
provides=('libfreetype.so' $_origpkgname=$pkgver-$pkgrel)
conflicts=($_origpkgname)
install=freetype2.install
backup=('etc/profile.d/freetype2.sh')
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        http://download.savannah.gnu.org/releases/freetype/freetype-doc-${pkgver}.tar.bz2{,.sig}
        http://download.savannah.gnu.org/releases/freetype/ft2demos-${pkgver}.tar.bz2{,.sig}
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0005-freetype-2.5.2-more-demos.patch
        freetype2.sh)
sha1sums=('f251029d5ab542a96dd4531605fe577185077560'
          'SKIP'
          '22949e7c809d7d5931331ca54da30e4d195669ea'
          'SKIP'
          'b7f7633ca0b828ca319afdd09a81b42592685d9c'
          'SKIP'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          'b1494810ed3aca25cdd8e8cedf634e5adfe6c09e'
          '41d27140fd590945e22e012c9dce62de3d6f11e6'
          '72cfecbe738085eec475e012617661ad0cc9b76f'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch

  sed -ri 's|/\* +(#define +CFF_CONFIG_OPTION_OLD_ENGINE) +\*/|\1|' include/freetype/config/ftoption.h

  cd ../ft2demos-${pkgver}
  # enable more demos
  patch -Np1 -i ../0005-freetype-2.5.2-more-demos.patch

  # Suppress RPATH
  sed -i '/X11_LIB:%=-R%/d' graph/x11/rules.mk
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static
  make

  # Build demos
  cd ../ft2demos-${pkgver}
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
  install -dm755 "${pkgdir}/usr/share/doc"
  cp -a docs "${pkgdir}/usr/share/doc/${_origpkgname}"

  # Package demos
  cd ../ft2demos-${pkgver}
  for _i in bin/{f,t}t*; do
    libtool --mode=install install $_i "$pkgdir/usr/bin/"
  done
}
