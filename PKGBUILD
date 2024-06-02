# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='utop'
pkgname="ocaml-$_projectname"
pkgver='2.14.0'
pkgrel='2'
pkgdesc='Universal toplevel for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD-3-Clause')
depends=('ocaml>=4.11.0' 'dune>=3.9.0' 'cppo>=1.1.2' 'ocaml-findlib>=1.7.2' 'ocaml-lambda-term>=3.1.0' 'ocaml-logs_lwt' 'ocaml-lwt' 'ocaml-react>=1.0.0' 'ocaml-zed>=3.2.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('726ff00d6ce13f6bb81b6e1ad82749094f25a6394f6552f2a976f270d182a7b600a9a17a1c692e56fa807332b25638a8cf0c2082c12ef93262ef5409633fba27')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	sed -i "s/%%VERSION%%/$pkgver/g" 'src/lib/uTop.ml'
}

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
