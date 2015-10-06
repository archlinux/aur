# Maintainer: lesebas < sebdeligny at gmail dot com>

pkgname=ocaml-extlib
pkgver=1.7.0
pkgrel=1
pkgdesc="Extends the OCaml standard library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ocaml-extlib/"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib' 'camlp4')
source=(https://github.com/ygrek/ocaml-extlib/archive/${pkgver}.tar.gz)
options=('staticlibs')

build() {
  cd ${srcdir}/ocaml-extlib-${pkgver}/src

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

  cd ${srcdir}/ocaml-extlib-${pkgver}

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
  
  # Install doc
  mkdir -p $_DOCDIR
  cp -r src/doc/* $_DOCDIR/
}
md5sums=('b50b02d9e40d35cc20c82d9c881a1bf6')
