# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mdx'
pkgname="ocaml-$_projectname"
pkgver='2.5.0'
pkgrel='1'
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
b2sums=('eba921dce1d50d5f1f6d649e57627002aeffb1715d80dd8825e5e63f974d9d15958a164d49baacfde651823b8e9046d360091d0bed0b084a4dcfb696e8df8e33'
        'ecf106081b4217a21724a645c2bd98beb27f2e9998bf32a64e8e770930701c65ec45903148e40ebe88dca639597f8e66dc232bd7281142466201a5138a764777')

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
