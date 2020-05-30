# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='zed'
pkgname="ocaml-$_projectname"
pkgver='3.0.1'
pkgrel='3'
pkgdesc='Abstract engine for text edition in OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.1' 'ocaml-react' 'ocaml-charinfo_width>=1.1.0')
makedepends=('dune>=1.1.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-add-set_pos.diff::$url/commit/ccaf2d790231844e8affd5d55e051748eb27a68b.diff"
	"$pkgname-$pkgver-$pkgrel-add-insert_str.diff::$url/commit/79b4b9b0d31c09f4fb58ed44713570752b7d994d.diff"
)
sha256sums=('35eefce0e35b10894bbae6c903758f3ab25363aadd605fb7dcdbc53aac5580f7'
            '209a2ccace5aa227148f7236c685d1cf7e2bd6735979497cef986b1d82b06379'
            'd9da851b0ce94685229a53c43ee9c736dd39a1a3b20005d15123c21127836344')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-add-set_pos.diff"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-add-insert_str.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
