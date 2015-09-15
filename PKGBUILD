# Maintainer: Tyler <tjb0607 at gmail dot com?
# Contributor: Austin <doorknob60 at gmail dot com>
pkgname=libsndobj-cvs
pkgver=20100712
pkgrel=1
pkgdesc="The Sound Object Library is an object-oriented audio processing library."
arch=('i686' 'x86_64')
url="http://sndobj.sourceforge.net/"
license=('GPL')
groups=('lib')
depends=()
makedepends=('cvs' 'scons')

_cvsroot=":pserver:anonymous@sndobj.cvs.sourceforge.net:/cvsroot/sndobj"
_cvsmod="sndobj"

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

  scons prefix=/usr pythonmodule=true instdir="$pkgdir" || return 1
}

package() {
  cd "$srcdir/$_cvsmod-build"
  scons install || return 1
}
