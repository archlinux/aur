# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='async'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
pkgdesc='Monadic concurrency library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-async_kernel>=0.16.0' 'ocaml-async_rpc_kernel>=0.16.0' 'ocaml-async_unix>=0.16.0' 'ocaml-core>=0.16.0' 'ocaml-core_kernel>=0.16.0' 'ocaml-core_unix>=0.16.0' 'ocaml-ppx_jane>=0.16.0' 'ocaml-ppx_log>=0.16.0' 'ocaml-textutils>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4668387de903654e9a73eb8218c9a70d5652d7e8ee255e0dfa6f86c4ba99260e9303499b97ff288c8184ba7e77c47964bfce2ce27bbbab4e4d59d2c9f6863505')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because checkdeps qtest_deprecated and netkit_sockets seem to not be publicly available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
