# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.34.0'
pkgrel='2'
pkgdesc='Utilities for working with Jane Street AST constructs'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-cmdliner>=1.3.0' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0>=0.15.0' 'ocaml-yojson' 'zstd')
makedepends=('dune>=3.8.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-stdlib-shims-dep.diff'
)
b2sums=('1f9196b32c21b5a13fb4e43afa342e5032c6d707040e949a8b5ea104da5a751f58550739943324697e424022a48760d4f894449a42d12f8b501c34723abc03dd'
        'a655ab803280b2f695005349f3be50e2e8f79e4e72e8b6791e3eb990ca86174ee445441de74a1660a27ca0b550a952266b98bf04e9240aa939825fa03022d74d')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
