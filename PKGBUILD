# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='js_of_ocaml'
pkgname="ocaml-$_projectname"
pkgver='6.2.0'
pkgrel='2'
pkgdesc='Compiler from OCaml to Javascript'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('binaryen' 'ocaml>=4.14.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-graphics' 'ocaml-lwt>=2.4.4' 'ocaml-lwt_log' 'ocaml-menhir' 'ocaml-ppxlib>=0.35.0' 'ocaml-react>=1.2.2' 'ocaml-reactivedata>=0.2' 'ocaml-sedlex>=3.3' 'ocaml-tyxml>=4.6' 'ocaml-yojson>=2.1.0' 'ocaml-findlib>=1.5.1' 'zstd')
makedepends=('dune>=3.19.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('f684fdfaa9276d7b9061ea3a074c914b8d85adf476b54d13dff8725313d4d6c597bf419665b9f90c09e1bd510949df545d3f78c6b63bc1d818741a875a3dd502')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency (qcheck would be a checkdep
# of this package, but it also depends on ocaml-alcotest, which depends on this package)

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
