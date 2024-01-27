# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname="ocaml-syntax-shims"
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Backport new OCaml syntax to older compilers'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$pkgname"
license=('ISC')
depends=('ocaml>=4.02.3')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('fa3ba304f1fcc751d41d45687b57e8c5511bbc1b644ea14807f884cf2c6c5275c324ec5f9f55b02b56195af803b2bce7f07afea408fb36f9a6d5d9b85edf6719')

_sourcedirectory="$pkgname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
