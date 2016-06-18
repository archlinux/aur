# Maintainer: Tyler <tjb0607 at gmail dot com?
# Contributor: Austin <doorknob60 at gmail dot com>
pkgname=libsndobj-cvs
pkgver=20121024
pkgrel=1
pkgdesc="an object-oriented audio processing library"
arch=('i686' 'x86_64')
url="http://sndobj.sourceforge.net/"
license=('GPL')
groups=('lib')
depends=()
makedepends=('cvs' 'scons')
source=('SndPVOCEX.diff')
md5sums=('bf509789b5c2c738d742d7a30ccfc8a1')

_cvsroot=":pserver:anonymous@sndobj.cvs.sourceforge.net:/cvsroot/sndobj"
_cvsmod="sndobj"

prepare() {
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
  patch -p0 < ../SndPVOCEX.diff
}

build() {
  cd "$srcdir/$_cvsmod-build"
  scons prefix=/usr instdir="$pkgdir" || return 1
}

package() {
  cd "$srcdir/$_cvsmod-build"
  # installation assumes this even if the Python module isn't built
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"
  scons install || return 1
  # get rid of the bogus directory again
  rm -rf "$pkgdir/usr/lib/python2.7"
}
