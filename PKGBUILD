# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: malet <malet@invalid>
_projectname='visitors'
pkgname="ocaml-$_projectname"
pkgver='20251010'
pkgrel='1'
pkgdesc='An OCaml syntax extension for generating visitor classes'
arch=('x86_64' 'aarch64')
url="https://gitlab.inria.fr/fpottier/$_projectname"
license=('LGPL-2.1-only')
depends=('ocaml>=4.14.2' 'ocaml-ppx_deriving>=5.0' 'ocaml-ppxlib>=0.36.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_projectname-$pkgver.tar.gz"
	'remove-result-dep.diff'
)
b2sums=('b80c4035fcd9f67a8420e6a1f810894fc2c57f6a201ba6e20b4435c7fe80049054a820a2ac83086da70b743d5acdb50d3b533f28c62bc3ba3941dbaa48b1840b'
        '43876ca327f4b054ecf7ca6dacd6df862c4963c145db8c9725ced5b29a64d6b6a7939bc7745417405f51b828ffc80fffcc7a859f73293e35a31a6f8792615a29')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove result dependency, as we're always running on OCaml >= 4.03.0
	patch --forward -p1 < '../remove-result-dep.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
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
