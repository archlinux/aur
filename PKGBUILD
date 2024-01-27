# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ocplib-endian'
pkgname="ocaml-$_projectname"
pkgver='1.2'
pkgrel='6'
pkgdesc='Optimised functions to read and write int16/32/64 from strings, bytes and bigarrays'
arch=('x86_64' 'aarch64')
url="https://github.com/OCamlPro/$_projectname"
license=('LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception')
depends=('ocaml>=4.03.0')
makedepends=('cppo' 'dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2e70be5f3d6e377485c60664a0e235c3b9b24a8d6b6a03895d092c6e40d53810bfe1f292ee69e5181ce6daa8a582bfe3d59f3af889f417134f658812be5b8b85')

_sourcedirectory="$_projectname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
