# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='alcotest'
pkgname="ocaml-$_projectname"
pkgver='1.8.0'
pkgrel='1'
pkgdesc='Lightweight and colourful test framework for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.14.0' 'ocaml-astring' 'ocaml-async>=0.16.0' 'ocaml-async_kernel' 'ocaml-async_unix>=0.16.0' 'ocaml-base' 'ocaml-cmdliner>=1.2.0' 'ocaml-core>=0.16.0' 'ocaml-core_unix>=0.16.0' 'ocaml-duration' 'ocaml-fmt>=0.8.7' 'ocaml-js_of_ocaml>=5.8.0' 'ocaml-logs' 'ocaml-lwt' 'ocaml-mirage-clock>=2.0.0' 'ocaml-re>=1.7.2' 'ocaml-uutf>=1.0.1')
makedepends=('dune>=3.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-shim-deps.diff'
)
b2sums=('63ad6a8349a1ed0b0a61db7b816b30a020bda23374a5672543b758a227079d7129b2b3bd3e40cc8b71bb753c366116d0e9f7aea57011986099f1c129fcda7a55'
        '6d9a0cf3496a7c3fdcdd4c39299f60c80caf61afffce8c4fd3639309dca4d943071678d75acea7f3be3fb7760dbacf117355126b8d316213e1df2a9d7ef57cba')

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
