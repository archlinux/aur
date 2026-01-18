# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=binsec
pkgver=0.11.0
pkgrel=1
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
    'ocaml-ocamlformat'
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
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/binsec/binsec/archive/refs/tags/${pkgver}.tar.gz"
    "0000-fix-ocaml54-build.patch::https://github.com/binsec/binsec/commit/04eb163540abd8cf48da279e3945d5d7f22151a4.patch"
)
b2sums=('c86fe5b772662ce2ed6b891f11b907367f54bb8a7e6fa65ab37e7e30c7ad6831b02b130dd7180c74abd727435daf37f9519cf2bad7f1cb3c03d8f4c4f06b82b0'
        '9bf6433880473ca9a74914f8720a4b2b14e8a7da563a2a3cd4f225901419ae3ecc49f33647eee7b8eb6694ee920c45e9c627c5917cbae4f7eec10c431329d9e9')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input=../0000-fix-ocaml54-build.patch
}

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
