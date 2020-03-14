# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='migrate-parsetree'
pkgname="ocaml-$_projectname"
pkgver='1.6.0'
pkgrel='1'
pkgdesc='Convert OCaml parsetrees between different major versions'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$pkgname"
license=('custom:LGPL2.1 with linking exception')
depends=('glibc' 'ocaml>=4.02.3' 'ocaml-ppx_derivers' 'ocaml-result')
makedepends=('dune>=1.9.0' 'ocaml-findlib')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('032f6f8033b547ff1636238f78b7e8b8b02481497806d4bb0b379ff56a9ac3ff')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$pkgname" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$pkgname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$pkgname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
