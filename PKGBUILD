# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='alcotest'
pkgname="ocaml-$_projectname"
pkgver='1.9.1'
pkgrel='1'
pkgdesc='Lightweight and colourful test framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.14.0' 'ocaml-astring' 'ocaml-async>=0.16.0' 'ocaml-async_kernel' 'ocaml-async_unix>=0.16.0' 'ocaml-base' 'ocaml-cmdliner>=1.2.0' 'ocaml-core>=0.16.0' 'ocaml-core_unix>=0.16.0' 'ocaml-duration' 'ocaml-fmt>=0.8.7' 'ocaml-js_of_ocaml>=5.8.0' 'ocaml-logs' 'ocaml-lwt' 'ocaml-mirage-clock>=2.0.0' 'ocaml-re>=1.7.2' 'ocaml-uutf>=1.0.1')
makedepends=('dune>=3.0.0')
checkdepends=('nodejs')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-shim-deps.diff'
)
b2sums=('03aba14619ce68899843d97b6dff7295529ccaa648a45373ac4e990bfeb1a356072ebf86241324c83450c0e2b725265b3a64b8a8c90db40570fff82389364dcf'
        '3e650c4899aedabc082e79a0b45c29e119bee59213f961704545e840c2a735074847fbd5e8ea7b23acb0b09fce3c8b62399b922843efde054e085be9c0b60c4d')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

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
	dune build @runtest-js --release --verbose
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
