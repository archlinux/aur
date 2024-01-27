# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='async_rpc_kernel'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
pkgdesc='Platform-independent core of Async RPC library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-async_kernel>=0.16.0' 'ocaml-core>=0.16.0' 'ocaml-ppx_jane>=0.16.0' 'ocaml-protocol_version_header>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('62381da44300df9f2c422fb1e439fe00316a5017963c2a3fb5d8b52f6268944cc52ec4b6b2cd694798717eaee2282e3bb10c59a7dc76ac41b2d319595e658e0f')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
