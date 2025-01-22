# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='oseq'
pkgname="ocaml-$_projectname"
pkgver='0.5.1'
_commit='b44a72b18210d69a894672c955828db1a4feab9c'
pkgrel='3'
pkgdesc='Purely functional iterators compatible with standard seq for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.08.0')
makedepends=('git' 'dune>=1.0.0')
checkdepends=('ocaml-containers' 'ocaml-gen' 'ocaml-qcheck')
options=('!strip')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	'LICENSE'
)
b2sums=('a52fcd5ad679d9a41d102b6887129dab5c6340569222c4b3e7b31d22520f377556b66cf0d6bfa8c8f199e514aabe0b6d77681537524a1a1f979f57bdbe6158d1'
        '9ace1b41953a8c1d81cd6f15f354b69ed85cf7a427244e126abbe2683e7cdd2c2581c97cc43683eb7efeafa7795a1a123eabbc8c2402e25844e97094f7d14ea0')
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

	install -Dm644 '../LICENSE' "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
