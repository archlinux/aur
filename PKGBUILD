# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dscheck'
pkgname="ocaml-$_projectname"
pkgver='0.5.0'
pkgrel='2'
pkgdesc='Experimental model checker for testing concurrent algorithms'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.12.0' 'ocaml-cmdliner' 'ocaml-containers' 'ocaml-oseq' 'ocaml-tsort')
makedepends=('dune>=3.9.0')
checkdepends=('ocaml-alcotest>=1.6.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('2f267b58bab1085ba05b23056e3551f3afa9f6f9ca0995adb8893ff05b7005fc88a582a18f96d1f86212f62744af41590ba56918feb06d01f8d71381a588d7d8')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
