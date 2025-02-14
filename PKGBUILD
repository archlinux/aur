# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='js_of_ocaml'
pkgname="ocaml-$_projectname"
pkgver='6.0.1'
pkgrel='1'
pkgdesc='Compiler from OCaml to Javascript'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('binaryen' 'ocaml>=4.14.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-graphics' 'ocaml-lwt>=2.4.4' 'ocaml-lwt_log' 'ocaml-menhir' 'ocaml-ppxlib>=0.15.0' 'ocaml-react>=1.2.2' 'ocaml-reactivedata>=0.2' 'ocaml-sedlex>=3.3' 'ocaml-tyxml>=4.6' 'ocaml-yojson>=2.1.0' 'ocaml-findlib>=1.5.1' 'zstd')
makedepends=('dune>=3.17.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c775def542344ce64d577d8c9d6dca39e33300d8153c6b518f71372dc13b39149fba676f53a0d049f1e17c38193f0bac4e8acbcd27a3ce22ed26dfc6567c125d')

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
