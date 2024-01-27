# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='reactiveData'
pkgname="ocaml-reactivedata"
pkgver='0.3'
pkgrel='1'
pkgdesc='Functional reactive programming with incremental changes in data structures for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-3.0-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.08.0' 'ocaml-react>=1.2.1')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ed3e1057f457b4c76060a7f6aad2a555b5a2baebe3d2b8938f2e6f5acad448d09a20b7b82fe8bb3ebb97e5c5946d70214d5bd062311af564752e40b880f75603')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder" | tr '[:upper:]' '[:lower:]')"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
