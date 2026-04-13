# Maintainer: Christopher Price <pricechrispy at gmail dot com>
pkgname=ocaml-otoml
_pkgname=otoml
pkgver=1.0.5
pkgrel=1
_pkgcommit=8215d6c79211ec42ec51dc321ee763ddeec36c1e
pkgdesc='A TOML parsing and manipulation library for OCaml'
arch=('x86_64')
url='https://github.com/dmbaturin/otoml'
license=('MIT')
depends=(
'ocaml>=4.14.0'
'ocaml-menhir'
)
makedepends=(
'dune'
'ocaml-findlib'
'ocaml-result'
)
options=('!strip' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dmbaturin/$_pkgname/archive/$_pkgcommit.tar.gz" "patch.diff")
sha256sums=('ac9c7cc8043533999de68fc92710923cdc2679fdc482ed5d4c968b83614ee8d6' 'SKIP')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgcommit}"

    patch -p1 < "${srcdir}/patch.diff"

    export OCAMLPATH="$(ocamlfind printconf destdir)"

    dune build -p "$_pkgname"
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgcommit}"

    dune install "$_pkgname" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"

    install -dm755 "${pkgdir}/usr/share/"

    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
