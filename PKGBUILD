# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=dbench-git
pkgver=20110123
pkgrel=1
pkgdesc="A filesystem benchmark based on load patterns"
arch=('i686' 'x86_64')
url="http://dbench.samba.org/"
license=('GPL3')
depends=('smbclient')
makedepends=('git')

_gitroot="git://git.samba.org/sahlberg/dbench.git"
_gitname="dbench"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

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

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
