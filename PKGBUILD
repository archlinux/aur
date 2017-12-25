# Contributor: royrocks <royrocks13@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-git
pkgver=2990.471b8036
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Tux Paint is a free drawing program designed for young children."
url="http://www.newbreedsoftware.com/tuxpaint/"
license=('GPL')
depends=('sdl_ttf' 'sdl_mixer' 'sdl_image' 'sdl_pango' 'libpaper' \
  'librsvg' 'python2' 'fribidi' 'fontforge')
provides=('tuxpaint')
conflicts=('tuxpaint')
makedepends=('git' 'gperf' 'awk')
options=('!makeflags')
source=("git+https://git.code.sf.net/p/tuxpaint/tuxpaint")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-git}"
  sed -i 's+/usr/local+/usr+g' Makefile 
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR=$pkgdir install 
  rm -rf $pkgdir/usr/share/tuxpaint/CVS
  install $pkgdir/usr/X11R6/include/X11/pixmaps/tuxpaint.xpm \
    $pkgdir/usr/share/pixmaps/tuxpaint.xpm
  rm -rf $pkgdir/usr/X11R6 
  sed -i '1s/python/python2/' \
    $pkgdir/usr/share/doc/tuxpaint/zh_tw/mkTuxpaintIM.py
  sed -i '1s/python/python2/' \
    $pkgdir/usr/share/tuxpaint/fonts/locale/zh_tw_docs/maketuxfont.py
} 
