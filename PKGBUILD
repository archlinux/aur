# Maintainer: Axilleas Pi <axilleas@archlinux.gr>

pkgname=pewpew-git
pkgver=20120322
pkgrel=1
pkgdesc="A cool retro shooting game"
arch=('i686' 'x86_64')
url="https://github.com/mastergreg/pewpew"
license=('GPL3')
depends=('freeglut' 'freealut')
makedepends=('git' 'freeglut' 'freealut')

_gitroot="git://github.com/mastergreg/pewpew.git"
_gitname="pewpew"

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

  export LDFLAGS=${LDFLAGS//,--as-needed}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
