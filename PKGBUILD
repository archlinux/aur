# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dscheck'
pkgname="ocaml-$_projectname"
pkgver='0.4.0'
pkgrel='1'
pkgdesc='Experimental model checker for testing concurrent algorithms'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=4.12.0' 'ocaml-cmdliner' 'ocaml-containers' 'ocaml-oseq' 'ocaml-tsort')
makedepends=('dune>=3.9.0')
checkdepends=('ocaml-alcotest>=1.6.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4aa711269e8082419ec2d37a3b7be99cc61df4dcd2d449070caeefdc617c60cd3e64f30971e28bba90a3ad1fe99ff3ea7a5ddc6440e18421740d987c6aa22a1c')

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
