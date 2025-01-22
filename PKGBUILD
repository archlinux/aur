# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='zed'
pkgname="ocaml-$_projectname"
pkgver='3.2.3'
pkgrel='5'
pkgdesc='Abstract engine for text edition in OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD-3-Clause')
depends=('ocaml>=4.03.0' 'ocaml-react' 'ocaml-uuseg' 'ocaml-uucp>=2.0.0' 'ocaml-uutf')
makedepends=('dune>=3.0.0')
checkdepends=('ocaml-alcotest')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-shim-deps.diff'
)
b2sums=('d013d1d3341f04ec7aa141abaa175d3db9e57e3966c5a8adef7efb416e7ec3ae0800f554b0d943fa55cd8bbb6bfe069e6b5d7d23d2a38bf7f1e55f7cafe52943'
        '69913ea6b6f7164ada7bee97391dda26814fed55754d7e7a08eda73fec904be9e8a1437309c1f4232e540cf892705c173665e751c95b2155ac49fb565fe6a91f')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove result and uchar dependencies, as we're always running on OCaml >= 4.03.0
	patch --forward -p1 < '../remove-shim-deps.diff'
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

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
