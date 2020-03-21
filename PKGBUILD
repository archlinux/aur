# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_expect'
pkgname="ocaml-$_projectname"
pkgver='0.13.0'
pkgrel='1'
epoch='1'
pkgdesc='Cram like framework for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base>=0.13.0' 'ocaml-ppx_assert>=0.13.0' 'ocaml-ppx_compare>=0.13.0' 'ocaml-ppx_custom_printf>=0.13.0' 'ocaml-ppx_fields_conv>=0.13.0' 'ocaml-ppx_here>=0.13.0' 'ocaml-ppx_inline_test>=0.13.0' 'ocaml-ppx_sexp_conv>=0.13.0' 'ocaml-ppx_variants_conv>=0.13.0' 'ocaml-ppxlib>=0.9.0' 'ocaml-re>=1.8.0' 'ocaml-stdio>=0.13.0')
makedepends=('dune>=1.5.1')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dcb3ece35149ff745dc95aba4353080916ecae974cdfbd469ef505cd1f04f4bf')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

# fails because of a circular dependency on ppx_jane, "Error: No rule found for negative-tests/inline_tests_runner"
# and "Error: No rule found for negative-tests/inline_tests_runner.exe"
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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
