# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='js_of_ocaml'
pkgname="ocaml-$_projectname"
pkgver='5.9.0'
pkgrel='1'
pkgdesc='Compiler from OCaml to Javascript'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.08.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-graphics' 'ocaml-lwt>=2.4.4' 'ocaml-lwt_log' 'ocaml-menhir' 'ocaml-ppxlib>=0.22.0' 'ocaml-react>=1.2.2' 'ocaml-reactivedata>=0.2' 'ocaml-sedlex>=3.3' 'ocaml-tyxml>=4.6' 'ocaml-yojson' 'ocaml-findlib>=1.5.1' 'zstd')
makedepends=('dune>=3.15.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('3850e97ff43611e54f4af6bb3d355abb0915ba9f4516c85e2b2661b8fdfe4f029eea573a883d24636768abff5be7cd23c8e9144b484d6a12a82859eefd93de78')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency on this package by ocaml-cohttp

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
