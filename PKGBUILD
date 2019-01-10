# $Id: PKGBUILD 271839 2016-07-13 18:19:11Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# forked from https://github.com/archfan/infinality_bundle
# package updated by: Andrew Fader <af@yagni.co>

pkgname=freetype2-infinality-ultimate
pkgver=2.9.1
pkgrel=1
_patchrel=2018.06.21
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
        0001-infinality-${pkgver}-${_patchrel}.patch
	freetype2.sh)

sha1sums=('220c82062171c513e4017c523d196933c9de4a7d'
          '97f4face95c81891e7e9dfc1fe29a8d6b9e1618e'
          'bc6df1661c4c33e20f5ce30c2da8ad3c2083665f')

prepare() {
  mv freetype-${pkgver} freetype2

  cd freetype2
  patch -Np1 -i ../0001-infinality-${pkgver}-${_patchrel}.patch
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
}
