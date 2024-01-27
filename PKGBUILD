# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='sexplib'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='Library for serializing OCaml values to and from S-expressions'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT' 'BSD-3-Clause')
depends=('ocaml>=4.14.0' 'ocaml-num' 'ocaml-parsexp>=0.16.0' 'ocaml-sexplib0>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f924d92ddf11f12be51073a3dfca45486d90b05533f29804518ee86b93386b8ff8d7e692c71d77b11347b78e9f6f6dcf7d79b71540efe54b013fa09b3bab414a')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _copy in 'COPYRIGHT.txt' 'THIRD-PARTY.txt'; do
		install -Dm644 "$_copy" "$pkgdir/usr/share/doc/$pkgname/$_copy"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
	ln -sf "/usr/share/doc/$pkgname/LICENSE-Tywith.txt" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
	for _license in 'COPYRIGHT.txt' 'THIRD-PARTY.txt'; do
		ln -sf "/usr/share/doc/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
