# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-gnuplot-mode-git
pkgver=0.7.0.29.g21f9046
pkgrel=2
pkgdesc="Emacs-mode for writing gnuplot scripts"
arch=('any')
url="https://github.com/bruceravel/gnuplot-mode"
license=('GPL2')
makedepends=('git' 'emacs' 'texlive-bin') # latter only for gpelcard.pdf
# should also work with xemacs or sxemacs
source=("git+https://github.com/bruceravel/gnuplot-mode.git")
md5sums=('SKIP')
_gitname="gnuplot-mode"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/"$_gitname"
  autoreconf
  ./configure --with-lispdir=/usr/share/emacs/site-lisp \
	      EMACS=emacs # ... or xemacs or sxemacs
  make
  latexmk -pdf gpelcard.tex
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  for _i in .tex .pdf
  do
    install -Dm644 gpelcard${_i} \
	    $pkgdir/usr/share/doc/emacs-gnuplot-mode/gpelcard${_i}
  done
  
}
