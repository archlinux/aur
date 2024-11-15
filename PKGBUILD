# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='ocaml-containers'
pkgver='3.15'
_commit='f519986f7f51500cc927dbd26906e17e8d3a3d4f'
pkgrel='1'
pkgdesc='A lightweight, modular standard library extension, string library, and interfaces to various libraries for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$pkgname"
license=('BSD-2-Clause')
depends=('ocaml>=4.12.0' 'dune>=3.0.0')
makedepends=('git')
checkdepends=('ocaml-csexp' 'ocaml-gen' 'ocaml-iter' 'ocaml-mdx' 'ocaml-qcheck>=0.18.0' 'ocaml-uutf' 'ocaml-yojson')
options=('!strip')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	'remove-either-dep.diff'
)
b2sums=('45dfedecff1aa772f8abcee9fb902ca21913a7fdd905bb933b644544f281c6802ed27c546a743fcbb0b1a639fe086fe8ba573b15a685fed752b5316b93578940'
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
