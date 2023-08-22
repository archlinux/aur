# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mdx'
pkgname="ocaml-$_projectname"
pkgver='2.3.0'
pkgrel='1'
pkgdesc='Executable code blocks inside markdown files for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/realworldocaml/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0' 'ocaml-astring' 'ocaml-cmdliner>=1.1.0' 'ocaml-csexp>=1.3.2' 'ocaml-findlib' 'ocaml-fmt>=0.8.7' 'ocaml-logs>=0.7.0' 'ocaml-odoc-parser>=1.0.0' 'ocaml-re>=1.7.2' 'ocaml-ocaml-version>=2.3.0')
makedepends=('dune>=3.5.0' 'cppo>=1.1.0')
checkdepends=('ocaml-alcotest' 'ocaml-lwt')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9c10bcbca42793f12fea4229d7deeb8d60e431badfc4912f506e08b28e86e5c76749aee10bdc3b7ca758ad0f36ae6fd6c19c3ed4b354d844480088f572b045c7')

_sourcedirectory="$_projectname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
