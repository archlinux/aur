# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=ocaml-ppx_deriving-git
pkgver=20191107
pkgrel=1
pkgdesc="Type-driven code generation for OCaml >=4.02"
arch=('x86_64')
url='https://github.com/ocaml-ppx/ppx_deriving'
license=('MIT')
provides=('ocaml-ppx_deriving')
conflicts=('ocaml-ppx_deriving')
depends=('ocaml' 'ocaml-migrate-parsetree' 'ocaml-ppxfind' 'ocaml-ppx_derivers' 'ocaml-ppx_tools-git' 'ocaml-result')
makedepends=('ocamlbuild' 'ocaml-findlib' 'cppo')
source=("${pkgname}::git://github.com/ocaml-ppx/ppx_deriving.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  dune build
}

package() {
  cd "$pkgname"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # remove rogue dune-package file
  rm -r "${pkgdir}/usr/lib/ocaml/ppx_deriving/dune-package"
}
