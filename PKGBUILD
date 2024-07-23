# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.33.0'
pkgrel='1'
pkgdesc='Utilities for working with Jane Street AST constructs'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0>=0.15.0' 'ocaml-yojson' 'zstd')
makedepends=('dune>=2.7.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-stdlib-shims-dep.diff'
)
b2sums=('a4b8b82912d6ea83104be05bc8784b4666c3749e906b4c52406f90924afafd2358bfbf2c6d715c02b6c55a539264c8f9655c1c44b7dfd239f63e6012bfa497cb'
        'ea788f8be0c78694deda9bbce59c0c98f1932776b10beeadc3b48b2685afa5c75da6943df80bc51ea68dde04463908b350d3cce366850a1d283a935c121cdf77')

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
