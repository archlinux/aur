# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
# Contributor: jmf <jmf at mesecons dot net>
pkgname=flightgear-git
pkgver=20150613
pkgrel=3
pkgdesc="An open-source, multi-platform flight simulator"
arch=('i686' 'x86_64')
url="http://flightgear.org/"
license=('GPL')
depends=('simgear-git' 'libxmu' 'libxi' 'zlib' 'fgdata-git' 'openscenegraph-git')
optdepends=()
makedepends=('git' 'boost')
provides=('flightgear-git')
conflicts=('flightgear')

_gitroot="git://git.code.sf.net/p/flightgear/flightgear"
_gitname="flightgear"

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

  cmake ../flightgear -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_QT=0 -DFG_DATA_DIR:STRING="/usr/share/flightgear" -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Debug

  make -j8 || return 1
}

package(){
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

