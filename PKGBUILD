# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='core'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='1'
epoch='1'
pkgdesc="Industrial strength alternative to OCaml's standard library"
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-base_bigstring>=0.17.0' 'ocaml-base_quickcheck>=0.17.0' 'ocaml-bin_prot>=0.17.0' 'ocaml-fieldslib>=0.17.0' 'ocaml-jane-street-headers>=0.17.0' 'ocaml-jst-config>=0.17.0' 'ocaml-ppx_assert>=0.17.0' 'ocaml-ppx_base>=0.17.0' 'ocaml-ppx_diff>=0.17.0' 'ocaml-ppx_hash>=0.17.0' 'ocaml-ppx_inline_test>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-ppx_optcomp>=0.17.0' 'ocaml-ppx_sexp_conv>=0.17.0' 'ocaml-ppx_sexp_message>=0.17.0' 'ocaml-sexplib>=0.17.0' 'ocaml-splittable_random>=0.17.0' 'ocaml-stdio>=0.17.0' 'ocaml-time_now>=0.17.0' 'ocaml-typerep>=0.17.0' 'ocaml-variantslib>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f684214800d7dce298b05408e6c5b22f588cdc55571ee12eeef927aa682f7d08c47dd678b8762270ce239173b129f4ab0c2550bdb49a9ecd56e9aa6939e89803')

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
