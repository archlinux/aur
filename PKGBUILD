#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=gnome-mud-git
pkgver=0_11_2.r131.gc719dc8
pkgrel=1
pkgdesc="GnomeMud is an advanced MUD client for GNOME"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/GnomeMud"
license=('GPL')
makedepends=('git' 'intltool')
depends=('gnet' 'gnome-common')
provides=('gnome-mud')
conflicts=('gnome-mud')

_gitroot=git://git.gnome.org/gnome-mud
_gitname=$pkgname

pkgver() {
  cd "$pkgname"
  ver=$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo ${ver#GNOMEMUD_*}
}

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

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

