# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='markup.ml'
pkgname="ocaml-markup"
pkgver='1.0.3'
pkgrel='1'
pkgdesc='Error-recovering streaming HTML5 and XML parsers for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/aantron/$_projectname"
license=('MIT')
depends=('ocaml>=4.03.0' 'ocaml-lwt' 'ocaml-uchar' 'ocaml-uutf>=1.0.0')
makedepends=('dune>=2.7.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1bb030fa2d79f7a7ac2d04c07c72a39e83620757b1d7d8a33eea1ec9b4c32883a67de45d1eea9bfa6533ae8076009fab9af5f180ad2be9c1fef66e3e5937048a')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
