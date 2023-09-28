# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='tyxml'
pkgname="ocaml-$_projectname"
pkgver='4.6.0'
pkgrel='1'
pkgdesc='A library for building correct HTML and SVG documents for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocsigen/$_projectname"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml>=4.04.0' 'ocaml-markup>=0.7.2' 'ocaml-ppxlib>=0.18.0' 'ocaml-re>=1.5.0' 'ocaml-seq' 'ocaml-uutf>=1.0.0')
makedepends=('dune>=2.7.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('25e07c55e04a1f4b02eea511625c1fbb138c168ba19f3b3d929c540d8dc7f96d9c2ec09bb221f592bf09610a542d66f3f8b9b930b1b824f4195e5e0b91b31088')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency on ocaml-js_of_ocaml

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
