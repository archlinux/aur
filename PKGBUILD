# Contributor: shade
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtex2html
pkgver=1.99
pkgrel=1
epoch=1
pkgdesc="Collection of tools for producing HTML documents from bibtex-bibliographies"
url="https://github.com/backtracking/bibtex2html"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('perl')
makedepends=('ocaml' 'git' 'hevea' 'texlive-latexextra' 'texlive-bibtexextra')
source=(git+$url.git#commit=8f25afb95a839c9f9522a34013d5c905af14378b)
md5sums=('SKIP')

build() {
  cd $pkgname
  autoreconf
  ./configure --prefix=/usr
  sed -i 's+-lstr+/usr/lib/ocaml/libcamlstr.a+' Makefile
  make 
  # to get cross references right
  hevea manual.tex
  pdflatex manual.tex
}

package() {
  cd $pkgname
  make prefix="$pkgdir"/usr install 
  install -Dm644 manual.pdf "$pkgdir"/usr/share/doc/$pkgname/$pkgname.pdf
  install -Dm644 manual.html "$pkgdir"/usr/share/doc/$pkgname/$pkgname.html
}
