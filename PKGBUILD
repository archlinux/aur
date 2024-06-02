# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mdx'
pkgname="ocaml-$_projectname"
pkgver='2.4.1'
pkgrel='4'
pkgdesc='Executable code blocks inside markdown files for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/realworldocaml/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0' 'camlp-streams' 'ocaml-astring' 'ocaml-cmdliner>=1.1.0' 'ocaml-csexp>=1.3.2' 'ocaml-findlib' 'ocaml-fmt>=0.8.7' 'ocaml-logs>=0.7.0' 'ocaml-re>=1.7.2' 'ocaml-ocaml-version>=2.3.0' 'zstd')
makedepends=('dune>=3.5.0' 'cppo>=1.1.0')
checkdepends=('ocaml-alcotest' 'ocaml-lwt')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-result-dep.diff'
)
b2sums=('3c80e6b5223eacea90727d23ecd454e1b31f7fbbdb6a0d588e66162f3fa8bbbae32221b8d8819b46c75ae12facaaf9ab213384f0cc36b80f18cf58c5314821bc'
        '92ed0828fb3dd6e166dd14f3c109eaf62c06b59ad3819c44c411f192930d070e5a62ceae3219fcf8abd5f65ce4e84cb6ed51eba3c1ebe776d3ad8a260f95f7b3')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove result dependency, as we're always running on OCaml >= 4.03.0
	patch --forward -p1 < '../remove-result-dep.diff'

	# Replace version watermarks
	find . -type f -exec sed -i "s/%%VERSION%%/$pkgver/g" {} +
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
