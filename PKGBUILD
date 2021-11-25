# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_expect'
pkgname="ocaml-$_projectname"
pkgver='0.14.2'
pkgrel='1'
epoch='1'
pkgdesc='Cram like framework for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base>=0.14.0' 'ocaml-ppx_here>=0.14.0' 'ocaml-ppx_inline_test>=0.14.0' 'ocaml-ppxlib>=0.18.0' 'ocaml-re>=1.8.0' 'ocaml-stdio>=0.14.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('bb00e15057ea403241781d2d6a385200496adc79680a01d031416192f8c93efd75a6998602a90d0aba7fcb2110e876b058126bb6397d5ba7fe5dd48c03202169')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails because of a circular dependency on ppx_jane, "Error: No rule found for negative-tests/inline_tests_runner"
# and "Error: No rule found for negative-tests/inline_tests_runner.exe"
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
