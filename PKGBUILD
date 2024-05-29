# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='alcotest'
pkgname="ocaml-$_projectname"
pkgver='1.7.0'
pkgrel='2'
pkgdesc='Lightweight and colourful test framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.11.0' 'ocaml-astring' 'ocaml-async>=0.15.0' 'ocaml-async_kernel' 'ocaml-async_unix>=0.15.0' 'ocaml-base' 'ocaml-cmdliner>=1.1.0' 'ocaml-core>=v0.15.0' 'ocaml-core_unix>=0.15.0' 'ocaml-duration' 'ocaml-fmt>=0.8.7' 'ocaml-js_of_ocaml>=3.11.0' 'ocaml-logs' 'ocaml-lwt' 'ocaml-mirage-clock>=2.0.0' 'ocaml-re>=1.7.2' 'ocaml-uutf>=1.0.1')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'fix-time_unix-deprecation.diff'
	'remove-shim-deps.diff'
)
b2sums=('83a9b1bb3a6d9ec09de739e77a6e1085bbca328f5be39f6ab28931a7bc16d223d571917f924598ddcc399910f986df95eb72ae61f28512221d9de6174ffe3988'
        '7f991edd57b4eb3ccdab617fa5e4246f01e27d1ba0533927c02ca7a9097c9f5d6a8a553fdb2438f55b46a6b7df07bb03cd76ce8fe691a4613c4fd5956270c704'
        '428401f907f9cde71f52bb9fda40fd680913d3cd415a0d8653b9402737125e2f511b854fc3a00729e90241d91642cd64b982fada22a861f7ef49e8e18210cf21')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix core_unix.time_unix deprecation (based on https://github.com/mirage/alcotest/commit/289e52b8b2e1df8ca2034ba0d0e855b9f01edf51)
	patch --forward -p1 < '../fix-time_unix-deprecation.diff'

	# Remove stdlib-shims and syntax-shims dependencies, as we're always running on OCaml >= 4.08.0
	patch --forward -p1 < '../remove-shim-deps.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
