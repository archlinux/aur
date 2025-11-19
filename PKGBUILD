# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='qcheck'
pkgname="ocaml-$_projectname"
pkgver='0.27'
pkgrel='1'
pkgdesc='QuickCheck inspired property-based testing for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.08.0' 'ocaml-alcotest>=1.2.0' 'ocaml-ounit>=2.0.0' 'ocaml-ppx_deriving>=6.1.0' 'ocaml-ppxlib>=0.36.0')
makedepends=('dune>=2.8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ec1aaf2190ed5450b0233f75829e1cb09a2149d25165707468c59cc14afe7f5434eb3e515b390982c36e0646b030e5921366d47b3788c788bc9320e7ee539633')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
