# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: malet <malet@invalid>
_projectname='visitors'
pkgname="ocaml-$_projectname"
pkgver='20210608'
pkgrel='7'
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
b2sums=('43cbfd6a9a4f462e4c196ae736b9944e1dd6d14608a0339ebbc079692a4c28766fae1c3df7d36b6c83aabf07f916a5b7eb017f56d21b76935c4ef1df7bff49a0'
        '077604788344f2462910ceb4496ebab84e81bbc744226ea2c448574d8884549171b9f3cba2287230524f7d8976403ea8b465df94e6e23607d4f65ae9380f0a3f')

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
