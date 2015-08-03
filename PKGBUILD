# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=0verkill-git
pkgver=20130806
pkgrel=1
pkgdesc="Bloody 2D action deathmatch-like game in  ASCII-ART"
arch=('i686' 'x86_64')
url="http://artax.karlin.mff.cuni.cz/~brain/0verkill/"
license=('GPL')
depends=('xproto' 'libx11')
makedepends=('git')
conflicts=('0verkill')

_gitroot='https://github.com/hackndev/0verkill.git'
_gitname='0verkill'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
