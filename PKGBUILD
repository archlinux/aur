# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-bisect
pkgver=1.3
pkgrel=1
pkgdesc="Code coverage tool for OCaml"
arch=('i686' 'x86_64')
url=("http://bisect.x9c.fr")
license=('GPLv3')
depends=('ocaml' 'ocaml-findlib')
makedepends=('ocaml')
_pkgname=bisect
source=(http://bisect.x9c.fr/distrib/${_pkgname}-${pkgver}.tar.gz)
md5sums=('8481342a3d9f17d5502bc84c04c206e3')

build () {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  chmod +x ./configure
  ./configure || return 1
  make all || return 1
}

package () {
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  cd "${srcdir}/${_pkgname}-${pkgver}"

  sed "s|PATH_INSTALL=|PATH_INSTALL=${pkgdir}/|" -i Makefile
  mkdir -p "${OCAMLFIND_DESTDIR}"
  OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" DESTDIR="${pkgdir}" PREFIX="/usr" make install || return 1
  install -D "doc/bisect.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/bisect.pdf"
}
