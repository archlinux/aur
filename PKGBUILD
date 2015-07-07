# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Nils Gey <list@nilsgey.de>
# Author: Thorben Hohn

pkgname=libflashsupport-jack
pkgver=20110801
pkgrel=1
pkgdesc="JACK-audio-connection-kit support for Flash"
arch=('i686' 'x86_64')
url="http://sourceforge.net/users/torbenh/"
license=('GPL')
makedepends=('git')
depends=('openssl' 'jack')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://repo.or.cz/libflashsupport-jack.git"
_gitname="libflashsupport-jack"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./bootstrap.sh
  ./configure --prefix=/usr
  sed -i 's|#define V4L1|//#define V4L1|' ./flashsupport.c || return 1
  make
}

package() {
 cd "$srcdir/$_gitname-build"

 make DESTDIR=${pkgdir} install
} 

