# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=freeimage-cvs
pkgver=20101223
pkgrel=1
pkgdesc="FreeImage is a library for developers who would like to support popular graphics image formats."
url="http://freeimage.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
makedepends=('cvs')
provides=('freeimage')
conflicts=('freeimage')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@freeimage.cvs.sourceforge.net:/cvsroot/freeimage"
_cvsmod="FreeImage"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"


  #
  # BUILD HERE
  #

  #./autogen.sh
  #./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
  
  make -f Makefile.fip || return 1
  make -f Makefile.fip DESTDIR="$pkgdir/" install || return 1
}
#category: system
