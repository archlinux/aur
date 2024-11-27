# Maintainer: Zhiwei Chen <condy0919@gmail.com>

pkgname=merlin
pkgver=5.3
_pkgver=$pkgver-502 # Yes, it builds
pkgrel=1
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('x86_64')
depends=('ocaml' 'ocaml-yojson' 'ocaml-csexp')
makedepends=('git' 'dune')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=("${url}/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tbz")
sha256sums=('2cea46f12397fa6e31ef0c0d4f5e11c1cfd916ee49420694005c95ebb3aa24bc')
options=('!strip')
conflicts=('vim-ocaml-merlin-git')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  # no tests built
  rm -rf tests

  make all
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  DESTDIR="${pkgdir}" dune install merlin --prefix="/usr" --libdir="/usr/lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${pkgname}/dune-package
}
