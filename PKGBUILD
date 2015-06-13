pkgname=sflock-git
pkgver=r18.5785cfa
pkgrel=1
pkgdesc="A simple screen locker for X"
arch=('i686' 'x86_64')
url="https://github.com/benruijl/sflock"
license=('MIT')
depends=('libxext')
makedepends=('git')

_gitroot="git://github.com/benruijl/sflock.git"
_gitname="sflock"

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ]; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
  else
     git clone $_gitroot $_gitname
     cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting install..."

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}