# $Id: PKGBUILD 271839 2016-07-13 18:19:11Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=freetype2-infinality-ultimate
pkgver=2.7.1
pkgrel=5
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
source=(https://download.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.bz2
        0001-Enable-table-validation-modules.patch
	0002-infinality-${pkgver}-${_patchrel}.patch
	freetype2.sh
  infinality-settings.sh
  xft-settings.sh)

sha256sums=('3a3bb2c4e15ffb433f2032f50a5b5a92558206822e22bfe8cbe339af4aa82f88'
            '6d273254fd925d284e5f66e3861eaef69a4393f34872398b2c93af0d5e15d34e'
            '0d7e15b94a20ebcc4c857b062219118ae8f7f50f4c8ad108d1abaca99cdf2304'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467'
            '2041947007b27d58101b5aebdf225d79d2c6d64cf8ac07a71c225d9e027578a0'
            'a4b3db6882de85304c5e4099fca5832a598607f90e582bcd030df0e9b526cd0b')

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
