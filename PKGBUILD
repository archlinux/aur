# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=binsec
pkgver=0.11.1
pkgrel=2
pkgdesc='Open-source toolset to help improve software security at the binary level'
arch=('x86_64')
url='https://binsec.github.io'
license=('LGPL-2.1-or-later')
makedepends=(
    'dune>=3.0'
    'ocaml-menhir>=20181113'
    'ocaml-unisim_archisec'
)
checkdepends=(
    'ocaml-ounit'
    'ocaml-qcheck>=0.90'
    'ocaml-ppx_inline_test'
)
depends=(
    'bitwuzla'
    'glibc'
    'gmp'
    'ocaml-curses'
    'ocaml-grain_dypgen'
    'ocaml-ocamlgraph>=1.8.5'
    'ocaml-toml>=6'
    'ocaml-unionfind'
    'ocaml-zarith>=1.13'
    'ocaml>=4.14'
)
optdepends=(
    'bash: make_coredump.sh'
    'boolector: Boolector SMT solver'
    'z3: Z3 SMT solver'
    'cvc4: CVC4 SMT solver'
    'yices: Yices 2 SMT Solver'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/binsec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e6687fa7fe6c6a508579cce041a7b0757e13dccc9790dad0c3d40b9d7d82111e1d30a9d67ed0bcff5450c919ccef58c46abb9b647a85f1a391a8fb740e76202e')

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
