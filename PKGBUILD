# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='core_kernel'
pkgname="ocaml-$_projectname"
pkgver='0.13.1'
pkgrel='1'
epoch='1'
pkgdesc="Industrial strength alternative to OCaml's standard library (system-independent part)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.13.0' 'ocaml-base_bigstring>=0.13.0' 'ocaml-base_quickcheck>=0.13.0' 'ocaml-bin_prot>=0.13.0' 'ocaml-fieldslib>=0.13.0' 'ocaml-jane-street-headers>=0.13.0' 'ocaml-jst-config>=0.13.0' 'ocaml-ppx_assert>=0.13.0' 'ocaml-ppx_base>=0.13.0' 'ocaml-ppx_hash>=0.13.0' 'ocaml-ppx_inline_test>=0.13.0' 'ocaml-ppx_jane>=0.13.0' 'ocaml-ppx_sexp_conv>=0.13.0' 'ocaml-ppx_sexp_message>=0.13.0' 'ocaml-sexplib>=0.13.0' 'ocaml-splittable_random>=0.13.0' 'ocaml-stdio>=0.13.0' 'ocaml-time_now>=0.13.0' 'ocaml-typerep>=0.13.0' 'ocaml-variantslib>=0.13.0' 'ocaml-ppxlib>=0.9.0')
makedepends=('dune>=1.5.1')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2e9dec37cf1b1a05fa3ad24ae8efd1e389b82928d598db097771405da1d6b214')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

# fails because of a circular dependency on core
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest -p "$_projectname" --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	for _copy in 'MLton-license.txt' 'strftime.js-licence.txt' 'THIRD-PARTY.txt'; do
		install -Dm644 "$_copy" "$pkgdir/usr/share/doc/$pkgname/$_copy"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	for _license in 'LICENSE.md' 'MLton-license.txt' 'strftime.js-licence.txt' 'THIRD-PARTY.txt'; do
		ln -sf "/usr/share/doc/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
