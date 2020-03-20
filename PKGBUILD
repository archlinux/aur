# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tex2page-git
pkgver=20200131
pkgrel=1
pkgdesc="Lisp program for making Web pages from TeX documents"
arch=('any')
url="https://github.com/ds26gte/tex2page"
license=('custom')
depends=('bash' 'guile')
makedepends=('git' 'ghostscript' 'texlive-formatsextra' 'texlive-bibtexextra' 'texlive-core' 'ttf-ubuntu-font-family')
source=("git+https://github.com/ds26gte/tex2page")
md5sums=('SKIP')


pkgver() {
  cd "${pkgname%-git}"
  echo $(git log -1 --format="%cd" --date=short | sed 's|-||g')
}

build() {
  cd "${pkgname%-git}"
  ./configure --dialect=guile --prefix=/usr
  # creating the documentation
  yes "s"|luatex index || true
  mpost lambda.mp
  epstopdf lambda-1.eps
  makeindex index
  bibtex index 
  luatex index || true
  luatex index
}

check() {
  cd "${pkgname%-git}"
  # run the generated program to build html-docs, also a good test
  export GUILE_AUTO_COMPILE=0
  ./${pkgname%-git} index
  ./${pkgname%-git} index
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "${pkgname%-git}" "$pkgdir"/usr/bin/"${pkgname%-git}"
  install -Dm644 "${pkgname%-git}".sty "$pkgdir"/usr/share/texmf/tex/plain/"${pkgname%-git}".sty
  install -Dm644 "${pkgname%-git}".tex "$pkgdir"/usr/share/texmf/tex/plain/"${pkgname%-git}".tex
  # for texinfo sources
  install -Dm644 texi2p.tex "$pkgdir"/usr/share/texmf/tex/plain/texi2p.tex
  # manpage
  install -Dm644 "man/man1/${pkgname%-git}".1 "$pkgdir"/usr/share/man/man1/"${pkgname%-git}".1
  # bibtex file 
  install -Dm644 "${pkgname%-git}".bib \
	  "$pkgdir"/usr/share/texmf/bibtex/bib/"${pkgname%-git}"/"${pkgname%-git}".bib
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  # installing documentation other than manpage 
  for _i in index* lambda* mpexample*
  do
    install -Dm644 $_i "$pkgdir"/usr/share/doc/$pkgname/$_i
  done
}
