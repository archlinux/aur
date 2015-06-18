# Maintainer: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
# Contributor: jmf <jmf at mesecons dot net>
pkgname=simgear-git
pkgver=20150613
pkgrel=2
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('i686' 'x86_64')
url="http://simgear.sourceforge.net/"
license=('GPL')
depends=('glut' 'freealut' 'plib' 'openscenegraph-git' 'boost>=1.49')
optdepends=()
makedepends=('git')
provides=('simgear-git')
conflicts=('simgear')

_gitroot="git://git.code.sf.net/p/flightgear/simgear"
_gitname="simgear"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    git checkout next
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    git checkout next
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake ../simgear -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Release

  make || return 1
}

package(){
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

