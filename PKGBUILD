# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Mort Yao <soi@mort.ninja>
_projectname='pprint'
pkgname="ocaml-$_projectname"
pkgver='20230830'
pkgrel='1'
pkgdesc='A pretty-printing combinator library for OCaml '
arch=('x86_64' 'aarch64')
url="https://github.com/fpottier/$_projectname"
license=('LGPL-2.0-only WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.03.0')
makedepends=('dune>=1.3.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c5ece9c608c04c3556fa2b6c98392d086de0e94395d1791184858c723634df1a15983f03eced0789386e56b5ef4e9a8f790396a577397a9ceeff8f76a2657c44')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
