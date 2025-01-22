# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='async_kernel'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Monadic concurrency library for OCaml (core data structures)'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-core>=0.17.0' 'ocaml-core_kernel>=0.17.0' 'ocaml-ppx_jane>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c279604cd201ed77c3c00320e7f6bbb9272c581d13612bd878a72f6d8de51c4b7b7f6c73c962e77e55154a864f6b5a326e4e7d049b9c4a377a4cfe8ef30b717e')

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
