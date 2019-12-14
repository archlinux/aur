# Maintainer: robertfoster

pkgname=ocaml-sedlex-git
pkgver=r188.e4f029b
pkgrel=1
pkgdesc='Unicode-friendly OCaml lexer generator'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/alainfrisch/sedlex'
depends=('ocaml' 'ocaml-gen-git' 'ocaml-migrate-parsetree' 'ocaml-ppx_tools_versioned' )
source=("$pkgname::git+https://github.com/alainfrisch/sedlex")
options=(!strip !makeflags)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    sed -si 's,Pervasives.,Stdlib.,g' src/generator/gen_unicode.ml.inc
    dune build @install
}

package() {
    cd "$srcdir/${pkgname}"
    export OCAML_STDLIB_DIR="$(ocamlfind printconf destdir)"
    dune install --prefix=$pkgdir/usr --libdir=$pkgdir$OCAML_STDLIB_DIR 
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('SKIP')
