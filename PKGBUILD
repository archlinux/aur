# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=binsec
pkgver=0.9.0
pkgrel=1
pkgdesc='Open-source toolset to help improve software security at the binary level'
arch=('x86_64')
url='https://binsec.github.io'
license=('LGPL-2.1-or-later')
makedepends=('ocaml>=4.11' 'dune>=3.0' 'ocaml-menhir')
checkdepends=('ocaml-ounit' 'ocaml-qcheck')
depends=('glibc' 'gmp' 'ocaml-curses' 'ocaml-grain_dypgen' 'ocaml-ocamlgraph>=1.8.5' 'ocaml-toml' 'ocaml-zarith>=1.4' 'ocaml>=4.11')
optdepends=('bash: make_coredump.sh'
	    'bitwuzla: Bitwuzla SMT solver'
	    'boolector: Boolector SMT solver'
	    'z3: Z3 SMT solver'
	    'cvc4: CVC4 SMT solver'
	    'yices: Yices 2 SMT Solver')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/binsec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('45f68c6b4ce67a5bdd76dfd00e8675db118668ef1b6e97ceca25d27ac4e17239b8046ae02268ea33e3eef8412925836b1413dcf603ede58b2076ec9a08167e86')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune build --release

    # Fix copying errors for debug package, default mode is 400
    find _build -type f -exec chmod 644 {} \;
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    dune runtest --release --verbose
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    DESTDIR="${pkgdir}" dune install \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc" \
	   --release

    mv $pkgdir/usr/bin/make_coredump.sh $pkgdir/usr/share/binsec/utils/
}
