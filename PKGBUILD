# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
_projectname='graphics'
pkgname="ocaml-$_projectname"
pkgver='5.2.0'
pkgrel='1'
pkgdesc='OCaml graphics library'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml/$_projectname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.09.0' 'ocaml-compiler-libs' 'dune>=2.7.0' 'libx11' 'libxft' 'pkgconf')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c4b8d02967593fd3ad3723e8756b0c0684f71525b7876ef595e87270a0c0404461b7d2220b39e509b80f7d6f1c37135bf981d9129d0ea42d8a6a2075abc5ef2b')

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
