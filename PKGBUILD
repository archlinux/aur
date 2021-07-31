# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_gen_rec'
pkgname="ocaml-$_projectname"
pkgver='2.0.0'
pkgrel='2'
pkgdesc='A ppx rewriter that transforms a recursive module expression into a `struct`'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/flowtype/$pkgname"
license=('MIT')
depends=('ocaml' 'ocaml-ppxlib>=0.18.0')
makedepends=('dune')
checkdepends=('ocaml-ppx_deriving')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c598fe30555153972cd3741441c69508f1d5c7eebfdd0ca863d21c74ac4f8c4')

_sourcedirectory="$pkgname-$pkgver"

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
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
