# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=binsec
pkgver=0.10.0
pkgrel=1
pkgdesc='Open-source toolset to help improve software security at the binary level'
arch=('x86_64')
url='https://binsec.github.io'
license=('LGPL-2.1-or-later')
makedepends=(
    'dune>=3.0'
    'ocaml-menhir'
    'ocaml-unisim_archisec'
)
checkdepends=(
    'ocaml-ounit'
    'ocaml-qcheck'
)
depends=(
    'bitwuzla'
    'glibc'
    'gmp'
    'ocaml-curses'
    'ocaml-grain_dypgen'
    'ocaml-ocamlgraph>=1.8.5'
    'ocaml-toml'
    'ocaml-zarith>=1.4'
    'ocaml>=4.11'
)
optdepends=(
    'bash: make_coredump.sh'
    'boolector: Boolector SMT solver'
    'z3: Z3 SMT solver'
    'cvc4: CVC4 SMT solver'
    'yices: Yices 2 SMT Solver'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/binsec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e1c9d0758f60b7d923c0afbb51d7628925fc02a4f395282c7d36742d517d349e583c778df9960d60e0b75173dfce53412f3db576a183d2518f56c369ffa48768')

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
