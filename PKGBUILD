# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='js_of_ocaml'
pkgname="ocaml-$_projectname"
pkgver='5.4.0'
pkgrel='1'
pkgdesc='Compiler from OCaml to Javascript'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.08.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-graphics' 'ocaml-lwt>=2.4.4' 'ocaml-lwt_log' 'ocaml-menhir' 'ocaml-ppxlib>=0.22.0' 'ocaml-react>=1.2.1' 'ocaml-reactivedata>=0.2' 'ocaml-sedlex>=2.3' 'ocaml-tyxml>=4.3' 'ocaml-yojson' 'ocaml-findlib>=1.5.1')
makedepends=('dune>=3.7.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('acd0ec976a7cb52c0d6e16c4894bbf2dec67964ac234c2148acf89d5c324235ae2175f1e4110d2fd5e7d03ea81aa557d5fc445ff47868667dc96300242768c8c')

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
