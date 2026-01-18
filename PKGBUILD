# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at

_srcname=unionFind
_ocamlname=${_srcname,,}
pkgname=ocaml-$_ocamlname
pkgver=20250818
pkgrel=1
pkgdesc="OCaml implementations of the union-find data structure"
arch=('x86_64')
url="https://gitlab.inria.fr/fpottier/unionfind"
license=('LGPL-2.0-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml')
makedepends=('dune')
#checkdepends=('ocaml-monolith')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/unionfind-${pkgver}.tar.gz")
b2sums=('13106d26f9be64426aca84fafa5a4dabd9b7f9a318e6d0ef566aab9b505706f2a3d19b1966edea32ad0e89299df895007a93ecdea0327bb0d72edf47002ac0a0')

# TODO needs ocaml-hector package
# check() {
#    cd "${srcdir}/${_ocamlname}-${pkgver}"
#    dune runtest --verbose
# }

build() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    # TODO odoc
    dune build --verbose -p $_srcname
}

package() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

    DESTDIR="${pkgdir}" dune install -p $_srcname \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc"

    # Move doc
    mv "${pkgdir}/usr/share/doc/${_srcname}" "${pkgdir}/usr/share/doc/${pkgname}"

    # Move license file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
