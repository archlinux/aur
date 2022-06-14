# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='sexplib'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='2'
epoch='1'
pkgdesc='Library for serializing OCaml values to and from S-expressions'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-num' 'ocaml-parsexp>=0.15.0' 'ocaml-sexplib0>=0.15.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c31fed5e5bf48381a9b6a48085e7d8909471e38a8cc7586e3c520fe60c6df7a1eebcca1a0ca93cd4d1cc61c1c3c36211db05572273550f7218eb69dd97d27333')

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
	for _license in 'COPYRIGHT.txt' 'LICENSE.md' 'LICENSE-Tywith.txt' 'THIRD-PARTY.txt'; do
		ln -sf "/usr/share/doc/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
