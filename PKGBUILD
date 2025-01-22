# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_log'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Ppx_sexp_message-like extension nodes for lazily rendering log messages'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppx_compare>=0.17.0' 'ocaml-ppx_enumerate>=0.17.0' 'ocaml-ppx_expect>=0.17.0' 'ocaml-ppx_fields_conv>=0.17.0' 'ocaml-ppx_here>=0.17.0' 'ocaml-ppx_let>=0.17.0' 'ocaml-ppx_sexp_conv>=0.17.0' 'ocaml-ppx_sexp_message>=0.17.0' 'ocaml-ppx_sexp_value>=0.17.0' 'ocaml-ppx_string>=0.17.0' 'ocaml-ppx_variants_conv>=0.17.0' 'ocaml-sexplib>=0.17.0' 'ocaml-stdio>=0.17.0' 'ocaml-ppxlib>=0.28.0' 'zstd')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('357b9ea6743e887d2b156a4374bd88d4bf598ea85ca3d3391155b15dab2e8d0aeaddfd6745e5e46f53588e0065456ee4e06a5cfe3c049e7e78771d487b1fce56')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
