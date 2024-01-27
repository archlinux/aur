# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Maintainer: Lance Roy <ldr709@gmail.com>
_projectname='expect_test_helpers_core'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='Helpers for writing expectation tests for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-base>=0.16.0' 'ocaml-base_quickcheck>=0.16.0' 'ocaml-core>=0.16.0' 'ocaml-ppx_jane>=0.16.0' 'ocaml-re>=1.8.0' 'ocaml-sexp_pretty>=0.16.0' 'ocaml-stdio>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('057504994125e05c02264eef4766e58619d1f89039836b994487cc8627786c0e0d1491ab8a3ffa02ac19cb8d0754f4af88188a47d25cbe89c5a51b04ac002c95')

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
