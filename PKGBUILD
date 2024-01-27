# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dscheck'
pkgname="ocaml-$_projectname"
pkgver='0.3.0'
pkgrel='1'
pkgdesc='Experimental model checker for testing concurrent algorithms'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-cmdliner' 'ocaml-containers' 'ocaml-oseq' 'ocaml-tsort')
makedepends=('dune>=2.9.0')
checkdepends=('ocaml-alcotest>=1.6.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8f745c9e42b14e04d217c1039ce013c0268d640abe75f70002032a43f8de7a3c73758ccead65d0dfeb2ea504868aa0ed1a5753e72eac8c8be339edb9c3d7ba5a')

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
