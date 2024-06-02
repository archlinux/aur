# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dscheck'
pkgname="ocaml-$_projectname"
pkgver='0.4.0'
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
b2sums=('ba9977bb5684f837addc5ded45c278ba592c4fcf0dec0dc9895b5578c319a9a3dcd902e43af1f656a400835fd35f11c0d1cf41ae4d851178cf1208c65bbd743c')

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
