# $Id: PKGBUILD 271839 2016-07-13 18:19:11Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-infinality-ultimate
pkgver=2.7.1
pkgrel=3
_patchrel=2017.01.11
pkgdesc="TrueType font rendering library with Infinality patches and custom settings by bohoomil"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freetype.org/"
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
groups=('infinality-bundle')
depends=('zlib' 'bzip2' 'sh' 'libpng' 'harfbuzz')
makedepends=('libx11')
provides=("freetype2=$pkgver" 'freetype2-infinality' 'libfreetype.so')
conflicts=('freetype2' 'freetype2-infinality')
install=freetype2.install
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
	0002-infinality-${pkgver}-${_patchrel}.patch
	freetype2.sh
  infinality-settings.sh
  xft-settings.sh)

sha1sums=('4d08a9a6567c6332d58e9a5f9a7e9e3fbce66789'
          'b31882ef5e8447e761acee1c4a44c0630cd4d465'
          '7a23342d5d56274ff8a05c67f64b96e85929f629'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f'
          '4e3c69a2161e6becaab6e57edeebbedc8a264939'
          'a1859f2eacae2046a9ef705ac2bcc4bdf4fd9717')

prepare() {
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-infinality-${pkgver}-${_patchrel}.patch
}

build() {
  cd freetype2
  ./configure --prefix=/usr --disable-static --with-harfbuzz --with-png
  make
}

#check() {
#  cd freetype2
#  make -k check
#}

package() {
  cd freetype2
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../freetype2.sh "${pkgdir}/etc/profile.d/freetype2.sh"
  install -Dm644 ../xft-settings.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/xft-settings.sh"
  install -Dm644 ../infinality-settings.sh "${pkgdir}/etc/X11/xinit/xinitrc.d/infinality-settings.sh"
}
