# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_base=emacs-chess
pkgname=${_base}-git
pkgver=852.99789e0
pkgrel=1
pkgdesc="Chess client written entirely in Emacs Lisp"
arch=('any')
url="https://github.com/jwiegley/${_base}"
license=(GPL)
depends=(emacs)
makedepends=(git)
optdepends=('crafty: as chess engine' 'gnuchess: as chess engine')
sha512sums=('SKIP')
source=(git+${url})
install=advice.install

pkgver() {
  cd ${_base}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_base}
  sed -i 's/git:/https:/' .gitmodules
  git submodule init && git submodule update
}

build() {
  cd ${_base}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_base}
  make DESTDIR="$pkgdir/" install
  cp -r {pieces,sounds} "$pkgdir"/usr/share/emacs/site-lisp/
  find "$pkgdir" -type d -name .git -exec rm -fr {} \;
  cd "$pkgdir"/usr/share/emacs/site-lisp/pieces
  for _i in *.tar.xz; do
    bsdtar xf $_i
    rm $_i
  done
  find . -type f -exec chmod 644 {} \;
  find . -exec chown root:root {} \;
}