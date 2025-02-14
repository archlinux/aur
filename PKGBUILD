# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: malet <malet@invalid>
_projectname='visitors'
pkgname="ocaml-$_projectname"
pkgver='20250212'
pkgrel='1'
pkgdesc='An OCaml syntax extension for generating visitor classes'
arch=('x86_64' 'aarch64')
url="https://gitlab.inria.fr/fpottier/$_projectname"
license=('LGPL-2.1-only')
depends=('ocaml>=4.05.0' 'ocaml-ppx_deriving>=5.0' 'ocaml-ppxlib>=0.22.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_projectname-$pkgver.tar.gz"
	'remove-result-dep.diff'
)
b2sums=('74da6e2d06ebed3b1bee2885cc89a72eb914058da2df05822669134877df55d589395d7410e7ebb490645d86a44cbb2cacbb3d6c7e6bea1fe75eb6bb4a74b13b'
        '9d7eaf09bbdc114e7166b89ecb061b68967334559ff5670e5b0f38cb6204cf79a2c753446395299355589d0e4d84d91eab7876f19f96b75eb87b743cda7d65a4')

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
