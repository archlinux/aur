# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_opamname='charInfo_width'
pkgname="ocaml-${_opamname,,}"
pkgver='1.1.0'
pkgrel='7'
pkgdesc='Determine column width for a character'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kandu/$_opamname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.0' 'ocaml-result')
makedepends=('dune')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-LICENSE::$url/raw/20aaaa6dca8f1e0b1ace55b6f2a8ba5e5910b620/LICENSE"
)
sha256sums=('21b2ed7a7bfb92da47c01edb4126c0f2dedda37c9c07c8e17ab58abe38838172'
            '861f4f38563857ccf124b890b03182a1711c685b8e55c07e4e2565add10c885a')

_sourcedirectory="$_opamname-$pkgver"

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_opamname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -Dm644 "../$pkgname-$pkgver-$pkgrel-LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
