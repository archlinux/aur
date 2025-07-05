# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_expect'
pkgname="ocaml-$_projectname"
pkgver='0.17.3'
pkgrel='1'
epoch='1'
pkgdesc='Cram like framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-js_of_ocaml>=5.8.0' 'ocaml-ppx_here>=0.17.0' 'ocaml-ppx_inline_test>=0.17.0' 'ocaml-stdio>=0.17.0' 'ocaml-ppxlib>=0.36.0' 'zstd')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8a92dd674b864826c9094ed8be44343c8c1c14b0bc29c0a4e6a400094a126ff5097493677b31d9465c0afee46623e07832d5704423a540e3e0fb4582677c0d53')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
