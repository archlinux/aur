# Maintainer: P. A. López-Valencia <https://aur.archlinux.org/users/vorbote/>

pkgname=libreoffice-uglyfix-freetype2
pkgver=2.8.1
pkgrel=1
pkgdesc="TrueType font rendering library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
depends=('zlib' 'bzip2' 'libpng' 'harfbuzz' 'libreoffice')
options=(!docs)
source=(http://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2{,.sig}
        libreoffice-uglyfix-noautohint.patch
        0001-Enable-table-validation-modules.patch
        0003-Enable-infinality-subpixel-hinting.patch
        0004-Enable-long-PCF-family-names.patch)
sha384sums=('ce6bb0163feee05388c34fbe1379c6bc86802385b147864bc610cdf397b5e84578a7f6e774b02e2615514b57aa44f4b8'
            'SKIP'
            '51cd38441d7f4e92172b376324d959261bb41a427fd01df01badcbe13cdabf67d17101548b309640d3cc3c47c18ac5aa'
            '2b047946d7da45ad8cac5b7f4929bbaefe742867cc33620af36bedd26ed20e0a53b97e7a740ad7bed2502f8ea2067da9'
            '950be33ca918e769291cac1d5349739737281089d0ff812d329dbe8ca92fad07245b6d74629012a43249a40b92e68f8f'
            '7e2a34397eaafadcf247cb3380d61ee73d4658680fc14f5c4067e4c981d97f3799bbfacd79b22a8827b157fcadc558a3')
validpgpkeys=('58E0C111E39F5408C5D3EC76C1A60EACE707FDA5')

prepare() {
  # Rename source dir to allow building the demos
  cd freetype-$pkgver

  patch -Np1 -i ../libreoffice-uglyfix-noautohint.patch

  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
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
