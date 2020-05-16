# Maintainer: Runney Wu <an9wer@gmail.com>

_commit=045a0fa
_pkgname=st
pkgname=an9wer-$_pkgname
pkgver=0.8.3.r9.g045a0fa
pkgrel=1
pkgdesc="A simple terminal implementation for X"
url="https://st.suckless.org/"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('xorgproto' 'libx11' 'libxft')
source=("$_pkgname::git://git.suckless.org/st")
md5sums=('SKIP')

prepare() {
  cd "$_pkgname"

  if [ -e "$BUILDDIR/$_pkgname/config.h" ]; then
    warning "Use $BUILDDIR/$_pkgname/config.h"
    cp "$BUILDDIR/$_pkgname/config.h" config.h
  else
    warning "Use default config.h"
    cp config.def.h config.h
  fi
}

pkgver() {
  cd "$_pkgname"
  git checkout "$_commit" &> /dev/null
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README  "$pkgdir/usr/share/doc/$_pkgname/README"
}
