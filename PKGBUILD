# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ocaml-containers'
pkgver='3.13'
_commit='7c1ca1d82f3894bbfb634cbd421f696e854cafbc'
pkgrel='1'
pkgdesc='A lightweight, modular standard library extension, string library, and interfaces to various libraries for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$pkgname"
license=('BSD')
depends=('ocaml>=4.08.0' 'dune>=2.9.0' 'ocaml-either')
checkdepends=('ocaml-csexp' 'ocaml-gen' 'ocaml-iter' 'ocaml-mdx' 'ocaml-qcheck>=0.18.0' 'ocaml-uutf' 'ocaml-yojson')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('SKIP')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
