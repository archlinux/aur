# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: Zhiwei Chen <condy0919@gmail.com)

_pkgname=yojson
pkgname=ocaml-${_pkgname}
pkgver=2.0.2
pkgrel=1
pkgdesc="Low level JSON binary for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
provides=('ocaml-yojson')
conflicts=('ocaml-yojson')
depends=('ocaml' 'ocaml-biniou' 'ocaml-easy-format')
makedepends=('dune' 'cppo')
source=(https://github.com/ocaml-community/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tbz)
sha256sums=('876bb6f38af73a84a29438a3da35e4857c60a14556a606525b148c6fdbe5461b')

build() {
    cd ${_pkgname}-${pkgver}

    # no benchmarks
    rm -rf bench/

    # we're using ocaml > 4.08
    sed -i '/libraries seq/d' lib/dune

    make all
}

package() {
    cd ${_pkgname}-${pkgver}

    DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="/usr/lib/ocaml"

    # remove rogue dune-package file
    rm -r "${pkgdir}"/usr/doc
    rm -r "${pkgdir}"/usr/lib/ocaml/${_pkgname}/dune-package
}
