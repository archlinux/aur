# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_deriving'
pkgname="ocaml-$_projectname"
pkgver='6.0.2'
pkgrel='2'
epoch='1'
pkgdesc='Type-driven code generation for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.05.0' 'ocaml-findlib' 'ocaml-ppx_derivers' 'ocaml-ppxlib>=0.32.0' 'zstd')
makedepends=('cppo>=1.1.0' 'dune>=1.6.3')
checkdepends=('ocaml-ounit')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('dc597740321f8f8e6d5b837cbb1dc4b9a7c4b00314455e24d4671b187e3bda8b10c232df95fe7fef67064250b73f4fb21cb3f2b3c64e43e41f400bc395b767cd')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
