# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='re'
pkgname="ocaml-$_projectname"
pkgver='1.10.3'
pkgrel='1'
pkgdesc='Pure OCaml regular expressions, with support for Perl and POSIX-style strings'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml/$pkgname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.02.0' 'ocaml-seq')
makedepends=('dune>=2.0.0')
checkdepends=('ocaml-ounit')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'fix-ounit-name.diff'
)
sha512sums=('c86bc375d52ba4d0363d56636dd389c29ce3fc430f569fd5c3af3265023bb80462d94ea9fce97387fdebc8731d33166871ac2f9162327674c2b97bdbde423bbd'
            'cd665ef2d43a82f26a34480265db42031b8f9cd4b0b71890f3e7fc029c1e68c4f518f1ced2b78deedc522808df0037da83b5527f6442aaf65c5dfb1b7823166f')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../fix-ounit-name.diff'
}

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
