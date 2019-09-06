# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: nerflad <nerflad@gmail.com)

_pkgname=yojson
pkgname=ocaml-${_pkgname}
pkgver=1.4.1
pkgrel=6
pkgdesc="Low level JSON binary for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
depends=('ocaml-biniou' 'ocaml-easy-format')
makedepends=('dune' 'cppo')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
        'https://github.com/ocaml-community/yojson/commit/a8095892a38d2a4e98f963c2627ac8cc484e0bbf.patch')
sha256sums=('c081a8cb5a03bddbcac4614f468cf5edafe11805277572af4071e362be6611fb' '62aeecc4a880f59fcfaa51ad27826e0ad418adb59b3b125ec4d60fe7f671f1b9')

prepare() {
    cd ${_pkgname}-${pkgver}
    # fix jbuild dependencies for cppo generation
    patch -p1 -i "${srcdir}/a8095892a38d2a4e98f963c2627ac8cc484e0bbf.patch"
}
build() {
    cd ${_pkgname}-${pkgver}
    make all
}

check() {
    cd ${_pkgname}-${pkgver}
    make test
}

package() {
    cd ${_pkgname}-${pkgver}
    DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    rm -r "${pkgdir}"/usr/doc
}
