# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mdx'
pkgname="ocaml-$_projectname"
pkgver='2.5.1'
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
b2sums=('95ed607564e33fa884aae7b7326257cd565acc67a2581ac4b9d88a710c6c77cc66375f8f019b5eae5a145617b681b0500a3fa81c0710d1304d731fbcc2013f3d'
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
