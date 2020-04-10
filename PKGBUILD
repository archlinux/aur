# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_author='zandoye'
_opamname='charInfo_width'
_projectname="${_opamname,,}"
pkgname="ocaml-$_projectname"
pkgver='1.1.0'
_changeset='6a2ed28ba68c'
pkgrel='2'
pkgdesc='Determine column width for a character'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://bitbucket.org/$_author/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.0' 'ocaml-result')
makedepends=('dune')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/get/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-LICENSE::$url/raw/049dc7b9e5c183a7c6bfc6e97f062e418f5be4bc/LICENSE"
)
sha256sums=('0601e0b9f0f1f225592360a53b634bc66cef134f8d1ff0c9071e69ecc3257b01'
            '861f4f38563857ccf124b890b03182a1711c685b8e55c07e4e2565add10c885a')

_sourcedirectory="$_author-$_projectname-$_changeset"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_opamname" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$_opamname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_opamname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -Dm644 "../$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
