# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ocaml-containers'
pkgver='3.15'
_commit='e1de3da1e32413e8faf32dab58a0be8bbc9be51d'
pkgrel='3'
pkgdesc='A lightweight, modular standard library extension, string library, and interfaces to various libraries for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$pkgname"
license=('BSD-2-Clause')
depends=('ocaml>=4.12.0' 'dune>=3.0.0')
makedepends=('git')
checkdepends=('ocaml-csexp' 'ocaml-gen' 'ocaml-iter' 'ocaml-mdx' 'ocaml-qcheck>=0.18.0' 'ocaml-uutf' 'ocaml-yojson')
options=('!strip')
source=(
	# $pkgrel added to make sure our cached source file doesn't get used, as the previous pkgrel used a different commit
	"$pkgname-$pkgver-$pkgrel::git+$url#commit=$_commit?signed"
	'remove-either-dep.diff'
)
b2sums=('feee8effb121b9064cf4673e0d9aa882fcfe430eb0cb62d762518d1f55a69f627c26e9e5a24e880878fe61234f9cd534f02b828759506a476705b64dcdd7adac'
        '079e0e5257bb8251f45168096bc4f42b259fbdaf44e61d72b3e75cb74a5a48f541c49f1eac4c4eb100302ffa4405d0dedd278b3cc8274d9126789dcbf8255ad4')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove either dependency, as we're always running on OCaml >= 4.12.0
	patch --forward -p1 < '../remove-either-dep.diff'
}

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
