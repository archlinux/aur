# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='sedlex'
pkgname="ocaml-$_projectname"
pkgver='3.6'
pkgrel='1'
pkgdesc='Unicode-friendly OCaml lexer generator'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-gen' 'ocaml-ppxlib>=0.26.0' 'zstd')
makedepends=('dune>=3.6.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('38dbff064865e00be58571689ddb5171abe0f8f61e659cdb10a713ac7a3db97d08e4330c6d3ddabd7934f96d300d26f776c52861a5c1cdc5e7ad0e2df1aabc92')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency on this package by ocaml-ppx_expect

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
