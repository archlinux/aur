# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-libocaml_lexing
pkgver=2014.08.08
pkgrel=1
pkgdesc="OCaml library for continuation-passing style lexing"
arch=('i686' 'x86_64')
url="http://git.grenouille.com/?p=libocaml_lexing.git"
license=('GPL3')
depends=('ocaml' 'ocaml-libocaml_exception')
makedepends=('git' 'ocaml-findlib')
options=('!strip')
source=("git://git.autogeree.net/~julm/libocaml_lexing.git#tag=v${pkgver//./-}"
        "git://git.autogeree.net/~julm/libocaml_make.git#tag=v2014-08-08"
        "git://git.autogeree.net/~julm/tool/pkg.git#tag=v2014-08-07")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
    cd "${srcdir}/${pkgname#ocaml-}"

    git submodule init
    git config submodule.lib/libocaml/make.url "${srcdir}/libocaml_make"
    git config submodule.lib/tool/pkg.url "${srcdir}/pkg"
    git submodule update

    # It seems to me that post-ocamllex is no longer necessary and introduces more problems than it solves
    sed -i 's/^[^#]/#\0/g' src/post-ocamllex
}

build() {
    cd "${srcdir}/${pkgname#ocaml-}"

    make OCAML_FLAGS=
}

package() {
    cd "${srcdir}/${pkgname#ocaml-}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlc -where)"
    install -dm755 "${OCAMLFIND_DESTDIR}"
    make install DESTDIR="${OCAMLFIND_DESTDIR}"
}
