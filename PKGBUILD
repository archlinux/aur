# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='async_log'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Logging library built on top of Async_unix'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-async_kernel>=0.17.0' 'ocaml-async_unix>=0.17.0' 'ocaml-core>=0.17.0' 'ocaml-core_kernel>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-timezone>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d1cb43c0a849d94957bd86f8a40207f843d473463c8207bfc41347c90d675fc0b3b3a1cb0fb9a7280bff03fb4b8cad2cc7b4e809f45bf371f8213612ce0321a0')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
