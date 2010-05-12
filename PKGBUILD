# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=dbmeasure-git
pkgver=20100512
pkgrel=1
pkgdesc="ALSA volume control verification/measurement tool"
arch=(i686 x86_64)
url="http://git.0pointer.de/?p=dbmeasure.git;a=summary"
license=('LGPL')
depends=('alsa-lib')
makedepends=('git')

_gitroot="git://git.0pointer.de/dbmeasure.git"
_gitname="dbmeasure"

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

  make || return 1
  #make DESTDIR=$pkgdir install || return 1

  mkdir -p $pkgdir/usr/bin
  cp dbmeasure dbverify $pkgdir/usr/bin/ || return 1
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cp README $pkgdir/usr/share/doc/$pkgname/ || return 1
}
