# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-chess-git  
pkgver=836.8257a9d
pkgrel=1
pkgdesc="Chess client written entirely in Emacs Lisp"
arch=('any')
url="http://github.com/jwiegley/emacs-chess.git"
license=('GPL')
depends=('emacs')
makedepends=('git')
optdepends=('crafty: as chess engine' 'gnuchess: as chess engine')
md5sums=('SKIP')
source=('git://github.com/jwiegley/emacs-chess.git')
install=advice.install
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
  cd $pkgdir/usr/share/emacs/site-lisp/pieces
  for _i in  *.tar.xz
  do bsdtar xf $_i
     rm $_i
  done
  find . -type f -exec chmod 644 {} \;
  find . -exec chown root:root {} \;
} 
