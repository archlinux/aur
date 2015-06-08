# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-else-git 
pkgver=2014_02_14
pkgrel=2
pkgdesc="Emacs Language Sensitive Editor -- minor mode to use language specific abbreviations"
url="http://home.comcast.net/~dharter46"
arch=('any')
license=('GPL')
depends=('emacs')
makedepends=('texlive-plainextra')
install=else.install
sources=('https://github.com/stefanhusmann/emacs-else.git')
md5sums=('SKIP')

pkgver(){
  cd emacs-else
  git log -1 --format="%cd" --date=short | tr - _ 
}

build() {
  cd emacs-else
  makeinfo else.texi 
  texi2pdf else.texi 
  sed -i 's/string-to-int/string-to-number/g' setnu.el 
  for _i in *.el
  do
    emacs -batch -q -f batch-byte-compile ${_i}
  done 
}

package() {
  cd emacs-else
  install -Dm644 else "$pkgdir"/usr/share/info/else.info 
  install -Dm644 else.pdf \
    "$pkgdir"/usr/share/doc/$pkgname/$pkgname.pdf 
  install -d "$pkgdir"/usr/share/emacs/site-lisp 
  for _i in *.lse *.el *.elc
  do 
    install -Dm644 ${_i} "$pkgdir"/usr/share/emacs/site-lisp
  done 
}
