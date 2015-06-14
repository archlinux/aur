# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=poly2tri-c-git
pkgver=p2tc.0.1.0.2.gc55fabf
pkgrel=1
pkgdesc='A C library for generating constrained delaunay triangulations and refining them.'
arch=('i686' 'x86_64')
url='https://code.google.com/p/poly2tri-c/'
license=('GPL')
depends=(glib2)
makedepends=(git)
provides=(poly2tri-c)
options=(!libtool)
_gitroot='https://code.google.com/p/poly2tri-c/'
_gitname='poly2tri-c'

pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --always | sed 's|-|.|g'
  fi
}

build(){
  cd "$srcdir"
  msg2 "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd $_gitname
    git pull origin
    msg2 "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg2 "GIT checkout done or server timeout"
  msg2 "Starting make"

  #./configure --prefix=/usr
  ./autogen.sh --prefix=/usr
  make
}
package(){
  cd "$srcdir"/$_gitname
  msg2 "Starting make install"
  make DESTDIR="$pkgdir/" install
}
