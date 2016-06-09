# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-chess-git  
pkgver=832.27f7bd7
pkgrel=2
pkgdesc="Chess client written entirely in Emacs Lisp"
arch=('any')
url="http://www.newartisans.com/2008/05/emacs-chess-now-hosted-at-github.html"
license=('GPL')
depends=('emacs')
makedepends=('git')
optdepends=('crafty: as chess engine' 'gnuchess: as chess engine')
md5sums=('SKIP')
source=('git://github.com/jwiegley/emacs-chess.git')
_gitname="emacs-chess"

pkgver() {
  cd "$srcdir"/$_gitname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update    
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  cp -r {pieces,sounds} $pkgdir/usr/share/emacs/site-lisp/
  find $pkgdir -type d -name .git -exec rm -fr {} \;
} 
