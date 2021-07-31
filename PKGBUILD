# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='sexplib'
pkgname="ocaml-$_projectname"
pkgver='0.14.0'
pkgrel='3'
epoch='1'
pkgdesc='Library for serializing OCaml values to and from S-expressions'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-num' 'ocaml-parsexp>=0.14.0' 'ocaml-sexplib0>=0.14.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ad75ab155e2b4e2fec63fb178ef25a0a5a7de3834b939db95f38287dfd21cc68')

_sourcedirectory="$_projectname-$pkgver"

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

	for _copy in 'COPYRIGHT.txt' 'THIRD-PARTY.txt'; do
		install -Dm644 "$_copy" "$pkgdir/usr/share/doc/$pkgname/$_copy"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	for _license in 'COPYRIGHT.txt' 'LICENSE.md' 'LICENSE-Tywith.txt' 'THIRD-PARTY.txt'; do
		ln -sf "/usr/share/doc/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
