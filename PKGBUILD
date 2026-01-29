# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at

_ocamlname=opam-file-format
pkgname=ocaml-$_ocamlname
pkgver=2.2.0
pkgrel=1
pkgdesc="Parser and printer for the opam file syntax"
arch=('x86_64')
url="https://opam.ocaml.org"
license=('LicenseRef-LGPL2.1-with-OCaml-LGPL-linking-exception')
depends=('dune' 'ocaml' 'ocaml-menhir')
checkdepends=('ocaml-alcotest' 'ocaml-fmt')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocaml/${_ocamlname}/releases/download/${pkgver}/${_ocamlname}-${pkgver}.tar.gz")
sha512sums=('87e1ddae79c47f48090b5e3205e0d2598e22838e065d0ea8924494ba225a4f8a8b4985a7eb3563652e9a9a5419741af7327035a01d446ebc7fedab468a8edb98')

build() {
	cd $srcdir/$_ocamlname-$pkgver
	dune build --verbose -p $_ocamlname
}

check() {
	cd $srcdir/$_ocamlname-$pkgver
	dune runtest --verbose
}

package() {
	cd $srcdir/$_ocamlname-$pkgver

	DESTDIR=$pkgdir dune install \
		   --prefix "/usr" \
		   --libdir "/usr/lib/ocaml" \
		   --docdir "/usr/share/doc" \
		   -p $_ocamlname

	# Move doc
	mv $pkgdir/usr/share/doc/${_ocamlname} $pkgdir/usr/share/doc/$pkgname

	# Move license file
	install -d $pkgdir/usr/share/licenses/$pkgname
	mv $pkgdir/usr/share/doc/${pkgname}/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
