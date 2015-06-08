# Contributor: royrocks <royrocks13@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-cvs
pkgver=20101127
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Tux Paint is a free drawing program designed for young children."
url="http://www.newbreedsoftware.com/tuxpaint/"
license=('GPL')
depends=('sdl_ttf' 'sdl_mixer' 'sdl_image' 'sdl_pango' 'libpaper' \
  'librsvg' 'python2' 'fribidi' 'fontforge')
provides=('tuxpaint')
conflicts=('tuxpaint')
makedepends=('cvs' 'gperf')
options=('!makeflags')
_cvsroot=":pserver:anonymous@tuxpaint.cvs.sourceforge.net:/cvsroot/tuxpaint"
_cvsmod="tuxpaint"

pkgver() {
  cd $srcdir
  if [ -d $_cvsmod/CVS ]; then
    msg2 "Updating existing checkout"
    cd $_cvsmod
    cvs -qz3 update -CdP > /dev/null
  else
    msg2 "Checking out upstream code"
    cvs -qz3 -d$_cvsroot co -P $_cvsmod > /dev/null
    cd $_cvsmod
  fi
  msg2 "Checkout up to date"
}

build() {
  cd $srcdir/$_cvsmod
  sed -i 's+/usr/local+/usr+g' Makefile 
  make
}
package() {
  cd $srcdir/$_cvsmod
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
