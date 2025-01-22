# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_gen_rec'
pkgname="ocaml-$_projectname"
pkgver='2.0.0'
pkgrel='7'
pkgdesc='A ppx rewriter that transforms a recursive module expression into a `struct`'
arch=('x86_64' 'aarch64')
url="https://github.com/flow/$pkgname"
license=('MIT')
depends=('ocaml' 'ocaml-ppxlib>=0.18.0' 'zstd')
makedepends=('dune')
checkdepends=('ocaml-ppx_deriving')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('d205aed7429d32caf4ad4c9098b5d34f0aa6e00fbab6a74658ffafd48589d5dc2e437fdb81fa1f4894047183d5e116ebac07df651e371b71d8e380a01975758c')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
