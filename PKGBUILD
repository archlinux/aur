# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.37.0'
pkgrel='1'
epoch='1'
pkgdesc='Utilities for working with Jane Street AST constructs'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.10.0' 'ocaml-base>=0.15.0' 'ocaml-cmdliner>=1.3.0' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0>=0.15.0' 'ocaml-yojson>=2.2.2' 'zstd')
makedepends=('dune>=3.8.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-stdlib-shims-dep.diff'
)
b2sums=('c1d1f3bed43e04377d094c758c751a887b280fdd3c7139392b0855672714f0e76de6fff566e8cc98ec5972b4228c7bfb46af580dec182dbe202b7b5bd55e420b'
        '4cf15c42b407b0aaabae83c587fbd1bad451bf7bbe5a179852adea8f287c577c0fc9f576f19953438ddbd6f7c02b41c7631ddfc9aa8e52e601bd765dd66c34b5')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove stdlib-shims dependency, as we're always running on OCaml >= 4.08.0
	patch --forward -p1 < '../remove-stdlib-shims-dep.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Fails because of a circular dependency on this package by ppx_jane
# check() {
#	cd "$srcdir/$_sourcedirectory/"
#	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
