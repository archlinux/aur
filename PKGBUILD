# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='gen'
pkgname="ocaml-$_projectname"
pkgver='1.1'
_commit='30802b92145e0c9cd235d3d2ba4d2210fda5612a'
pkgrel='5'
pkgdesc='Simple, efficient iterators for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('MIT')
depends=('ocaml>=4.07.0')
makedepends=('git' 'dune>=1.1.0')
options=('!strip')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	'remove-seq-dep.diff'
)
b2sums=('e090791078b4eb89bfcea3dc87c175065a93a1431024a320369e69414c8d655734e04847d3c8ae24ae1c740cd34af58aad67f88b16bc9cf8ae00142dbdf95991'
        'aeb7b304fcc2e5ccc0a40b82483d7c49dc0f21cd3302b1732c039f7d42317f4fabaf3a602554c6b9c6d86807730e53b4d8473f28adb9509c3f943c8d0fa3c1bc')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove seq dependency, as we're always running on OCaml >= 4.07.0
	patch --forward -p1 < '../remove-seq-dep.diff'
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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
