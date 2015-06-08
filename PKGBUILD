# Contributor: ledti <antegist at gmail.com>
# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=evilvte-git
_pkgname=evilvte
pkgver=150.8dfa41e
pkgrel=2
pkgdesc='VTE based, highly customizable terminal emulator.'
arch=('i686' 'x86_64')
url="http://www.calno.com/evilvte/"
license=('GPL2')
depends=('hicolor-icon-theme' 'vte290')
makedepends=('git' 'pkg-config')
provides=('evilvte')
conflicts=('evilvte')
install=evilvte.install
source=("$_pkgname::git://github.com/caleb-/evilvte.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # copy config.h to startdir to ease configuration:
  cd "$startdir"
  if [[ -e config.h ]]; then
    cp -f config.h "$srcdir/$_pkgname/src/"
    echo "To reset your configuration, remove $startdir/config.h"
  else
    cp "$srcdir/$_pkgname/src/config.h" config.h
    echo "Edit $startdir/config.h and recompile to change your settings."
  fi
}

build(){
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --with-gtk=3.0
  make
}

package(){
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

