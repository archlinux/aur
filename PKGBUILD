# Maintainer: ledti <antegist at gmail.com>

pkgname=bar-aint-recursive-git
pkgver=107.a447500
pkgrel=1
pkgdesc="A lightweight xcb based bar."
arch=('i686' 'x86_64')
url="https://github.com/LemonBoy/bar"
license=('MIT')
depends=('libxcb')
makedepends=('git')
provides=('bar-aint-recurisve')
conflicts=('bar-aint-recursive')
source=('bar::git+https://github.com/LemonBoy/bar.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/bar"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # copy config.h to startdir to ease configuration:
  cd "$startdir"
  if [[ -e config.h ]]; then
    cp -f config.h "$srcdir/bar/"
    echo "To reset your configuration, remove $startdir/config.h"
  else
    cp "$srcdir/bar/config.def.h" config.h
    echo "To change your bar settings, edit $startdir/config.h"
  fi
}
    
build() {
  cd "$srcdir/bar"
  make
}

package() {
  cd "$srcdir/bar"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # rename binary to avoid conflicting with 'bar' package in community:
  mv "$pkgdir/usr/bin/bar" "$pkgdir/usr/bin/bar-aint-recursive"
}
