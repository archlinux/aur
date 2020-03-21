# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_deriving'
pkgname="ocaml-$_projectname"
pkgver='4.4.1'
pkgrel='3'
pkgdesc='Type-driven code generation for OCaml >=4.02.2'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.2' 'ocaml-migrate-parsetree' 'ocaml-ppx_derivers' 'ocaml-ppx_tools' 'ocaml-result')
makedepends=('cppo' 'dune>=1.6.3' 'ocaml-ppxfind')
checkdepends=('ocaml-ounit')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'fix-ounit-name.diff'
)
sha256sums=('27bc57774724fc4f48775f2011375a5ee1439570204abbf6607761c472757e2f'
            '3d82a6676973966f4aa5c25e7a68167d5931b42066cac4ca440a5a9a9b7012c7')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../fix-ounit-name.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
