# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='re'
pkgname="ocaml-$_projectname"
pkgver='1.10.4'
pkgrel='2'
pkgdesc='Pure OCaml regular expressions, with support for Perl and POSIX-style strings'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml/$pkgname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.03.0' 'ocaml-seq')
makedepends=('dune>=2.0.0')
checkdepends=('ocaml-ounit')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'fix-ounit-name.diff'
)
sha512sums=('1bef38154f856b48985a0dfa975dc8539f146d0308d7c2af01078f5e998683fd635c7ae4a888e95c1a4dc4df9539dcd5dc506a5ef8718386cf0073947507f91a'
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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
