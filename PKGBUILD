# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mdx'
pkgname="ocaml-$_projectname"
pkgver='2.3.1'
pkgrel='1'
pkgdesc='Executable code blocks inside markdown files for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/realworldocaml/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0' 'camlp-streams' 'ocaml-astring' 'ocaml-cmdliner>=1.1.0' 'ocaml-csexp>=1.3.2' 'ocaml-findlib' 'ocaml-fmt>=0.8.7' 'ocaml-logs>=0.7.0' 'ocaml-re>=1.7.2' 'ocaml-result' 'ocaml-ocaml-version>=2.3.0')
makedepends=('dune>=3.5.0' 'cppo>=1.1.0')
checkdepends=('ocaml-alcotest' 'ocaml-lwt')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('cbecad52b652a8fc099c676c5ec0ad03e010f9c31e7a8f41850ba75bc4d11f8312026d5e9340acd3a0778714c8b915a96a84f123c16b8ef5d70ada1ffbf4aad7')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
