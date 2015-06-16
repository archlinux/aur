# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>>
pkgname=tclvfs-cvs
pkgver=20110315
pkgrel=3
pkgdesc="Virtual Filesystem support for Tcl"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tclvfs/"
license=('BSD')
depends=('tcl')
makedepends=('cvs')
provides=('tclvfs')
conflicts=('tclvfs')

_cvsroot=":pserver:anonymous:@tclvfs.cvs.sourceforge.net:/cvsroot/tclvfs"
_cvsmod="tclvfs"

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

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
}
