# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: charlesthehawk at yahoo dot com
# Contributor:  Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-sqlite3
_pkgname=sqlite3-ocaml
pkgver=4.4.0
pkgrel=1
pkgdesc="SQLite3 bindings for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/mmottl/sqlite3-ocaml"
license=('MIT')
makedepends=('ocaml' 'ocaml-findlib' 'sqlite3' 'ocamlbuild' 'jbuilder' 'opam')
source=(https://github.com/mmottl/sqlite3-ocaml/archive/${pkgver}.tar.gz)
md5sums=('2956d5696d45229a470e0f6e7409c876')
options=('!makeflags' 'staticlibs')

_pkgdir="$_pkgname-$pkgver"

build () {
  echo ${srcdir}/${_pkgname}-${pkgver}
  cd ${srcdir}/${_pkgname}-${pkgver}
  opam init -n --comp 4.07.0
  eval `opam config env`
  opam install base
  opam install stdio
  opam install configurator

  make all
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  cd _build/install/default/lib/sqlite3

  INSTALLDIR="${pkgdir}$(ocamlfind printconf destdir)"
  echo Install-Dir: ${INSTALLDIR}
  mkdir -p "$INSTALLDIR"
  chmod 755 "$INSTALLDIR"

  # src/sqlite3-ocaml-4.4.0/_build/install/default/lib/sqlite3/

  env DESTDIR=${pkgdir} \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
        ocamlfind install sqlite3 *
}

