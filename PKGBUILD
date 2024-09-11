# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='qcheck'
pkgname="ocaml-$_projectname"
pkgver='0.22'
pkgrel='2'
pkgdesc='QuickCheck inspired property-based testing for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.08.0' 'ocaml-alcotest>=1.2.0' 'ocaml-ounit>=2.0.0' 'ocaml-ppx_deriving>=5.2.1' 'ocaml-ppxlib>=0.22.0')
makedepends=('dune>=2.8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f7a2a377b0798fba1f3049cd6e8a313f5f0e3c35bb599c5e61eb819fff5f20aa63718454a104e0d378fa5cbd9b5d712741b0e8edbf68b403e4c649bb8a517810')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	ALCOTEST_COLUMNS='80' dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
