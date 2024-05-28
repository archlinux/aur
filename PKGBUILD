# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_expect'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='1'
epoch='1'
pkgdesc='Cram like framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppx_here>=0.17.0' 'ocaml-ppx_inline_test>=0.17.0' 'ocaml-stdio>=0.17.0' 'ocaml-ppxlib>=0.28.0' 'zstd')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f9d503b2e6cca52ee66572e0d6e415b4840c3cabed45be034c7ef8265645d0a8916275b314c1042df32a2a126464e944bfbe5982dfbf136ecea0ff8dfd422bac')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
