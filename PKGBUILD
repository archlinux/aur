# Maintainer: Vincent Bernardoff <vbmithr@gmail.com>

pkgname=quarry-git
pkgver=20120330
pkgrel=1
pkgdesc="Quarry is a multi-purpose GUI for several board games, at present Go, Amazons and Othello."
url="http://gitorious.org/quarry"
depends=('librsvg>=2.5')
makedepends=('xmlto')
source=('quarry.cfg')
sha1sums=('9d6d07f955f642f7feb69b90c971da9229eb1e2c')
install="quarry.install"
arch=('i686' 'x86_64')
license=('GPL')

_gitroot="git://gitorious.org/quarry/quarry.git"
_gitname="quarry"

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

  ./configure --prefix=/usr --disable-scrollkeeper-update
  make
  make html
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=$startdir/pkg install
  cp ../../quarry.cfg $startdir/pkg/usr/share/quarry
}
