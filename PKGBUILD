# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=meniou
pkgver=20130104
pkgrel=1
pkgdesc="A light customizable menu application (alpha version)"
arch=('i686' 'x86_64')
url="https://github.com/valr/meniou"
license=('GPL3')
depends=('gtk3')
makedepends=('git')
options=('!libtool')

_gitroot="git://github.com/valr/meniou.git"
_gitname="meniou"

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

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$_gitname-build/COPYING" "$pkgdir/usr/share/licenses/$_gitname/COPYING"
}
