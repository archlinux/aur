# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Maintainer: Lance Roy <ldr709@gmail.com>
_projectname='expect_test_helpers_core'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
epoch='1'
pkgdesc='Helpers for writing expectation tests for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-base_quickcheck>=0.17.0' 'ocaml-core>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-sexp_pretty>=0.17.0' 'ocaml-stdio>=0.17.0' 'ocaml-re>=1.8.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('484e5b54a37182a219f7a2c07f731b9f4ff7fe24fa4c785098ac9e55c2e28b3edacdeb99f33d46362b2e7fee66bdfe761e0bfc825c9af179a19031ac30db103c')

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
