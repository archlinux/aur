# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='alcotest'
pkgname="ocaml-$_projectname"
pkgver='1.7.0'
pkgrel='1'
pkgdesc='Lightweight and colourful test framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.11.0' 'ocaml-astring' 'ocaml-async>=0.15.0' 'ocaml-async_kernel' 'ocaml-async_unix>=0.15.0' 'ocaml-base' 'ocaml-cmdliner>=1.1.0' 'ocaml-core>=v0.15.0' 'ocaml-core_unix>=0.15.0' 'ocaml-duration' 'ocaml-fmt>=0.8.7' 'ocaml-js_of_ocaml>=3.11.0' 'ocaml-logs' 'ocaml-lwt' 'ocaml-mirage-clock>=2.0.0' 'ocaml-re>=1.7.2' 'ocaml-stdlib-shims' 'ocaml-syntax-shims' 'ocaml-uutf>=1.0.1')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'fix-time_unix-deprecation.diff'
)
sha512sums=('6e29cc39109f5d83a175578f48ff1b48fdf13913b7cdd332823a660c681ab0cd5dec41b10322226102b023d7c74620decf964458926abed56ae835e4e565014e'
            '1655ef9f2aff1380d86ecee62853174b4a6ef331151477b6afeacc6fd8af69c3b90c14993cdbea6659107432c1fe543096b73d19c148b3fdd76eb3afd84f1b9f')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix core_unix.time_unix deprecation (based on https://github.com/mirage/alcotest/commit/289e52b8b2e1df8ca2034ba0d0e855b9f01edf51)
	patch --forward -p1 < '../fix-time_unix-deprecation.diff'
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
