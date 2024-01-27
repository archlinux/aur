# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
_projectname='graphics'
pkgname="ocaml-$_projectname"
pkgver='5.1.2'
pkgrel='1'
pkgdesc='OCaml graphics library'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml/$_projectname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.09.0' 'ocaml-compiler-libs' 'dune>=2.1.0' 'libx11' 'pkgconf')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d4b92a34bcb11db2facbf0fa46b1a86fcad607f555d0068e430f8c4c3b6fdc07803f4bab61247c40941065e75e147e4063602a9c54593994cbd92548e25ee2df')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
