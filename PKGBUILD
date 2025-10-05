# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.36.2'
pkgrel='1'
epoch='1'
pkgdesc='Utilities for working with Jane Street AST constructs'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.10.0' 'ocaml-base>=0.15.0' 'ocaml-cmdliner>=1.3.0' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0>=0.15.0' 'ocaml-yojson' 'zstd')
makedepends=('dune>=3.8.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-stdlib-shims-dep.diff'
)
b2sums=('38bea599c038103a966824582248b26b31b4c24347dd76ece3819cd4cc23f49218e8b47aaaf4783d9fa8d74437b03c9b320e9d8a13c712c0d13cd75f7270b1a2'
        'c9a6dcaf6cb70796f58ca1d3f4c6f18abfcd0698778969a1af1bfdedac4b30f7763e2a636bd50081fbd7c0efd668dd5e7f34e6221bbdaa16711f9cb6e9319843')

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
