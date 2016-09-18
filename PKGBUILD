# Maintainer: P. A. López-Valencia <https://aur.archlinux.org/users/vorbote/>

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.7
pkgrel=2
pkgdesc="TrueType font rendering library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
depends=('zlib' 'bzip2' 'libpng' 'harfbuzz' 'libreoffice')
options=(!docs)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        libreoffice-uglyfix-noautohint.patch
        0001-Enable-table-validation-modules.patch
        0002-Enable-subpixel-rendering.patch
        0003-Enable-infinality-subpixel-hinting.patch)
sha1sums=('f251029d5ab542a96dd4531605fe577185077560'
          'SKIP'
          'ca4a8c9990fde44e30a155f597d836005df8b41d'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          'b1494810ed3aca25cdd8e8cedf634e5adfe6c09e'
          '41d27140fd590945e22e012c9dce62de3d6f11e6')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  cd freetype-$pkgver

  patch -Np1 -i ../libreoffice-uglyfix-noautohint.patch

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
}

build() {
  cd freetype-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd freetype-$pkgver
  make -k check
}

package() {
  cd freetype-$pkgver

  install -Dm755 "$srcdir/freetype-$pkgver/objs/.libs/libfreetype.so" "$pkgdir/usr/lib/libreoffice/program/libfreetype.so"
}
