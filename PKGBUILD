# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at

_ocamlname=pgocaml
pkgname=ocaml-$_ocamlname
pkgver=4.4.0
pkgrel=1
pkgdesc="Native OCaml interface to PostgreSQL databases"
arch=('x86_64')
url="https://github.com/darioteixeira/pgocaml"
license=('LicenseRef-LGPL2.1-with-OCaml-LGPL-linking-exception')
depends=(
    'ocaml'
    'ocaml-sexplib'
    'ocaml-rresult'
    'ocaml-ppx_deriving'
    'ocaml-re'
    'ocaml-hex'
    'ocaml-csv'
    'ocaml-calendar'
    'ocaml-ppx_sexp_conv'
)
makedepends=('dune')
checkdepends=('ocaml-ounit')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darioteixeira/pgocaml/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6ecca66827f4798efffd2df66d23cd1dc6ab7f4eb819188782e00593dae9c96c774d17900c22eff068b57aae3b02c3dcd99943afa5869e0e2290fec5706ee829')

check() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    # TODO figure out idiomatic test db generation
    # dune runtest --verbose
}

build() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    dune build --verbose -p pgocaml
}

package() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

    DESTDIR="${pkgdir}" dune install \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc" \
	   -p $_ocamlname

    # Move doc
    mv "${pkgdir}/usr/share/doc/${_ocamlname}" "${pkgdir}/usr/share/doc/${pkgname}"

    # Move license file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
