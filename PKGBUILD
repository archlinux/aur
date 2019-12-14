# Maintainer: robertfoster
pkgname=ocaml-gen-git
pkgver=r141.7eb42b1
pkgrel=1
pkgdesc='Iterators for OCaml'
license=('BSD')
arch=('i686' 'x86_64')
url='https://github.com/c-cube/gen/'
depends=('ocaml')
makedepends=('ocaml-findlib' 'dune')
source=("$pkgname::git+https://github.com/c-cube/gen")
options=(!strip !makeflags)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -si 's,Pervasives.,Stdlib.,g' src/gen.ml
    dune build @install
}

package() {
    cd "${srcdir}/${pkgname}"
    
    export OCAML_STDLIB_DIR="$(ocamlfind printconf destdir)"
    dune install --prefix=$pkgdir/usr --libdir=$pkgdir$OCAML_STDLIB_DIR --verbose
    install -Dm644 "${srcdir}/${pkgname}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('SKIP')
