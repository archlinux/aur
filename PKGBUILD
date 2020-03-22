# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_pkgname=ocaml-lsp
pkgname=ocaml-lsp-git
pkgver=r484.d57bd91
pkgrel=1
pkgdesc="OCaml Language Server Protocol implementation"
arch=('x86_64')
depends=('ocaml' 'ocaml-yojson' 'ocaml-ppx_yojson_conv_lib' 'ocaml-stdlib-shims' 'ocaml-menhir')
makedepends=('git' 'dune>=2.0')
url="https://github.com/ocaml/ocaml-lsp"
license=('ISC')
source=("${_pkgname}"::'git+https://github.com/ocaml/ocaml-lsp.git')
sha256sums=('SKIP')
options=('!strip')
provides=('ocaml-lsp')
conflicts=('ocaml-lsp')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_pkgname}"

  dune build
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/ocaml-lsp-server/dune-package
  rm "${pkgdir}"/usr/lib/ocaml/lsp/dune-package
}

