# Contributor: shade
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibtex2html-git
pkgver=1.99.r16.gf1b6b57
pkgrel=1
pkgdesc="Collection of tools for producing HTML documents from bibtex-bibliographies"
url="https://github.com/backtracking/bibtex2html"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('perl')
makedepends=('ocaml' 'git' 'hevea' 'texlive-latexextra' 'texlive-bibtexextra')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=(git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c3- | sed 's+-+.+' | sed 's+-+.r+'|tr - .
}

build() {
  cd ${pkgname%-git}
  autoreconf
  ./configure --prefix=/usr
  sed -i 's+-lstr+/usr/lib/ocaml/libcamlstr.a+' Makefile
  make 
  # to get cross references right
  hevea manual.tex
  pdflatex manual.tex
}

package() {
  cd ${pkgname%-git}
  make prefix="$pkgdir"/usr install 
  install -Dm644 manual.pdf "$pkgdir"/usr/share/doc/$pkgname/manual.pdf
  install -Dm644 manual.html "$pkgdir"/usr/share/doc/$pkgname/manual.html
}
