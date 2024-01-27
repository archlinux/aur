# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='core'
pkgname="ocaml-$_projectname"
pkgver='0.16.2'
pkgrel='1'
epoch='1'
pkgdesc="Industrial strength alternative to OCaml's standard library"
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-base_bigstring>=0.16.0' 'ocaml-base_quickcheck>=0.16.0' 'ocaml-bin_prot>=0.16.0' 'ocaml-fieldslib>=0.16.0' 'ocaml-jane-street-headers>=0.16.0' 'ocaml-jst-config>=0.16.0' 'ocaml-ppx_assert>=0.16.0' 'ocaml-ppx_base>=0.16.0' 'ocaml-ppx_hash>=0.16.0' 'ocaml-ppx_inline_test>=0.16.0' 'ocaml-ppx_jane>=0.16.0' 'ocaml-ppx_optcomp>=0.16.0' 'ocaml-ppx_sexp_conv>=0.16.0' 'ocaml-ppx_sexp_message>=0.16.0' 'ocaml-sexplib>=0.16.0' 'ocaml-splittable_random>=0.16.0' 'ocaml-stdio>=0.16.0' 'ocaml-time_now>=0.16.0' 'ocaml-typerep>=0.16.0' 'ocaml-variantslib>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2e68556773549e0bf302c8733c9fc57df3c0fd73a1b547dc17097f74c5b5482c816ef89853b437e49452da7c124ef32a8a0de0dff64d71145b2ab11befbe5bb2')

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
