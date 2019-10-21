# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-batteries-git
pkgver=20191021
pkgrel=1
pkgdesc="Batteries Included for OCaml"
arch=('i686' 'x86_64')
url="http://github.com/ocaml-batteries-team/batteries-included"
license=('LGPL')
depends=('ocaml' 'ocaml-findlib')
makedepends=('ocamlbuild')
optdepends=('ocaml-bisect')
provides=('ocaml-batteries')
conflicts=('ocaml-batteries')
source=("${pkgname}::git://github.com/ocaml-batteries-team/batteries-included.git")
md5sums=('SKIP')
install=$pkgname.install

pkgver () {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build () {
  cd "$pkgname"

  make all || return 1
  rm -f *.cma *.cmi *.cmo
  make doc || return 1
}

package () {
  destdir="$pkgdir/$(ocamlfind printconf destdir)"
  docdir="$pkgdir/usr/share/doc/ocaml-batteries"

  cd "$pkgname"

  mkdir -p "$destdir/batteries" "$destdir/stublibs" || return 1
  make DESTDIR="$destdir/" OCAMLFIND_DESTDIR="$destdir/" install || return 1
  make DOCROOT="$docdir/" install-doc || return 1
  install -Dm 644 ocamlinit "$docdir/ocamlinit" || return 1
}
