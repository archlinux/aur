# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='reactiveData'
pkgname='ocaml-reactivedata'
pkgver='0.3.1'
pkgrel='1'
pkgdesc='Functional reactive programming with incremental changes in data structures for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-3.0-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.08.0' 'ocaml-react>=1.2.1')
makedepends=('dune>=3.17.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('33340a492eea3db0033d32842d1a52d43b960386bc11a5776be8f992087aa216a702146ee902a6ab723ccdfb171fede35b666976012b487f7120c62352a4eaec')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder" | tr '[:upper:]' '[:lower:]')"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
