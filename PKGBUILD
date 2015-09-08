# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=ocaml-extlib
pkgver=1.6.1
pkgrel=2
pkgdesc="Extends the OCaml standard library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocaml-extlib/"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'camlp4')
source=(http://ocaml-extlib.googlecode.com/files/extlib-${pkgver}.tar.gz)
options=('staticlibs')

build() {
  cd ${srcdir}/extlib-${pkgver}

  make all
  make opt

  sed -i 's/cp odoc_style.css/#cp odoc_style.css/g' Makefile
  sed -i 's/ocamldoc -sort -html/ocamldoc -sort -keep-code -html -colorize-code/g' Makefile
  make doc

  # Install additional files
  sed -i 's/ocamlfind install extlib META/ocamlfind install extlib META *.cmo *.cmx *.ml/g' Makefile
}

package () {
  _DOCDIR="${pkgdir}/usr/share/doc/ocaml-extlib"

  cd ${srcdir}/extlib-${pkgver}

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
  
  # Install doc
  mkdir -p $_DOCDIR
  cp -r doc/* $_DOCDIR/
}
md5sums=('5643237a6410dc915347956cff97df86')
