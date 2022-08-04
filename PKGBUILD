# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='sexplib'
pkgname="ocaml-$_projectname"
pkgver='0.15.1'
pkgrel='1'
epoch='1'
pkgdesc='Library for serializing OCaml values to and from S-expressions'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-num' 'ocaml-parsexp>=0.15.0' 'ocaml-sexplib0>=0.15.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('05a1cbca244286020af6c5ba1d92b32f5d7940dc409c61a8fc5ff114bec60167c8381ae997b53998ea3c0d5167ee77bf160873958512199b06efec1a2a191a7b')

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
