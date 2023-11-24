# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='qtest'
pkgname="ocaml-$_projectname"
pkgver='2.11.2'
pkgrel='1'
pkgdesc='Inline (Unit) Tests for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/vincent-hugot/$_projectname"
license=('GPL3')
depends=('ocaml>=4.03.0' 'ocaml-ounit' 'ocaml-qcheck')
makedepends=('dune>=1.1.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3edb8471b29c9eb2f6ba11b157abf7ca43ef965d4b1500aaaf1acaeb261972a61c9b104887ada6ca63dc85e06b1d27e34f391885b2fbeb7ea5646323d3be08d0')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
