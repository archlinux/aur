# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Maintainer: Lance Roy <ldr709@gmail.com>
_projectname='ocaml_intrinsics'
pkgname='ocaml-intrinsics'
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='Library of intrinsics for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('86bf6ac7cb1da5de03224cc053e174ec22af766b6c5ab4ca1fde3c028405858cb97feeae6968d9054a7d6994491b9f2cdb8e198ee837ad4242f9cd812873ceaa')

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
