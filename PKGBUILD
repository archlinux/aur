# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=binsec
pkgver=0.9.1
pkgrel=2
pkgdesc='Open-source toolset to help improve software security at the binary level'
arch=('x86_64')
url='https://binsec.github.io'
license=('LGPL-2.1-or-later')
makedepends=('dune>=3.0' 'ocaml-menhir' 'ocaml-unisim_archisec')
checkdepends=('ocaml-ounit' 'ocaml-qcheck')
depends=('bitwuzla' 'glibc' 'gmp' 'ocaml-curses' 'ocaml-grain_dypgen' 'ocaml-ocamlgraph>=1.8.5' 'ocaml-toml' 'ocaml-zarith>=1.4' 'ocaml>=4.11')
optdepends=('bash: make_coredump.sh'
	    'boolector: Boolector SMT solver'
	    'z3: Z3 SMT solver'
	    'cvc4: CVC4 SMT solver'
	    'yices: Yices 2 SMT Solver')
source=("$pkgname-$pkgver.tar.gz::https://github.com/binsec/binsec/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('73b2a967d6b04188347f8d86c6fddbb58b6c762ee3f606471fd1899010ee4053ae5f83578483610cf84fada44bd1a34ad8902a6653115f1ab780c42b66b96aa7')

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
