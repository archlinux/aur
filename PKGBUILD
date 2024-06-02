# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
_projectname='graphics'
pkgname="ocaml-$_projectname"
pkgver='5.1.2'
pkgrel='2'
pkgdesc='OCaml graphics library'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml/$_projectname"
license=('LGPL-2.1-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.09.0' 'ocaml-compiler-libs' 'dune>=2.1.0' 'libx11' 'pkgconf')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('b9b75a87a1aaa584a5cae32b8d502fb8ecfb02bd7f887845cfaa3cebae93586fb8aa7bb97a8ed51d5dbee0a469c25528187a8e38a9ac4a29b09680c84c531a1f')

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
