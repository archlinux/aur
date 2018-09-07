# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-chess-git  
pkgver=850.5298bf5
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

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git submodule update    
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
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
