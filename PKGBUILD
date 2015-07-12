# Maintainer: jmf <jmf at mesecons dot net>

pkgname=openscenegraph-git
pkgver=20150613
pkgrel=1
pkgdesc="An Open Source, high performance real-time graphics toolkit - git mirror"
arch=('i686' 'x86_64')
url="http://www.openscenegraph.org/"
license=('GPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl')
optdepends=()
makedepends=('git')
provides=('openscenegraph-git')
conflicts=('openscenegraph' 'openscenegraph-svn')

_gitroot="git://github.com/openscenegraph/osg.git"
_gitname="osg"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake ../osg -DCMAKE_INSTALL_PREFIX=/usr -DLIBRARY_OUTPUT_PATH=/usr/lib -DCMAKE_BUILD_TYPE=Release

  make -j8 || return 1
}

package(){
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}

