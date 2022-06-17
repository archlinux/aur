# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: Zhiwei Chen <condy0919@gmail.com)

_pkgname=yojson
pkgname=ocaml-${_pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Low level JSON binary for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
provides=('ocaml-yojson')
conflicts=('ocaml-yojson')
depends=()
makedepends=('dune' 'cppo')
source=(https://github.com/ocaml-community/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tbz)
sha256sums=('ab5d863f7f951a8f7fb4a708399ca2da2cf139a5e0af7818145c20295420cb1a')

build() {
    cd ${_pkgname}-${pkgver}

    # Since we're using ocaml latest, at least 4.13.1
    sed -i '/(libraries seq)/d' lib/dune

    # No need to build the benchmarks
    rm yojson-bench.opam
    rm -r bench/

    make all
}

package() {
    cd ${_pkgname}-${pkgver}

    DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="/usr/lib/ocaml"

    # remove rogue dune-package file
    rm -r "${pkgdir}"/usr/doc
    rm -r "${pkgdir}"/usr/lib/ocaml/${_pkgname}/dune-package
}
