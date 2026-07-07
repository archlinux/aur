# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: RubenKelevra

_ocamlname=stdcompat
pkgname=ocaml-$_ocamlname
pkgver=21.1
pkgrel=4
pkgdesc="Compatibility module for OCaml standard library"
url="https://github.com/thierry-martinez/stdcompat"
license=('LGPL-2.1-or-later')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/thierry-martinez/stdcompat/archive/refs/tags/${pkgver}.tar.gz"
    0000-ocaml5.5.patch
)
depends=('ocaml')
makedepends=('dune')
arch=('x86_64')
b2sums=('b351696f0aed268cd067e20a7d0917a5580399b43e5de3e60fce0ab30a8093cd1808eda610d5a20eb721033f77c45f9b5c8dabc6d55862b023c363b212a505e8'
        'c5c554d6a019f70fc229031a3365852950ecaf0a144e023bcba51fe9a602d29c76d887df98db51c6233aea51b40798cbc35fbe4e946e6e2ec851340080344f0a')

prepare() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

	# Based on patches by
	#  - Fedora
	#     https://src.fedoraproject.org/rpms/ocaml-stdcompat
	#  - Macports
	#     https://github.com/macports/macports-ports/tree/master/ocaml/ocaml-stdcompat/files
	#  - rageltman
	#     https://aur.archlinux.org/packages/ocaml-stdcompat#comment-1077693
    patch --forward --strip=1 --input=../0000-ocaml5.5.patch
}

build() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    dune build --ignore-promoted-rules
}

check() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"
    dune test
}

package() {
    cd "${srcdir}/${_ocamlname}-${pkgver}"

    DESTDIR=$pkgdir \
	dune install -p stdcompat \
	--prefix "/usr" \
	--libdir "/usr/lib/ocaml" \
	--docdir "/usr/share/doc"

    install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/
    install -Dm644 CHANGES.md -t $pkgdir/usr/share/doc/$pkgname/

    rm -f $pkgdir/usr/share/doc/$_ocamlname/README.md
    rm -f $pkgdir/usr/share/doc/$_ocamlname/CHANGES.md
    rmdir $pkgdir/usr/share/doc/$_ocamlname
}
