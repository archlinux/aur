# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: malet <malet@invalid>
_projectname='visitors'
pkgname="ocaml-$_projectname"
pkgver='20200210'
pkgrel='1'
pkgdesc='An OCaml syntax extension for generating visitor classes'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.inria.fr/fpottier/$_projectname"
license=('LGPL2.1')
depends=('ocaml>=4.02.3' 'ocaml-ppx_deriving>=4.4' 'ocaml-ppx_tools' 'ocaml-result')
makedepends=('cppo' 'dune')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$_projectname-$pkgver.tar.gz"
	'dune-version.diff'
)
sha256sums=('b26ef1da80399af92f9da2f818c078317961daa4a68645e31160c1b0f4b8843e'
            'ed20ebe5ade715ac0d439ad01cd6e3cfad908ef09705a069d069bae0a251f7f6')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# Needed until Arch upgrades to dune>=2.0.0
	patch --forward -p1 < '../dune-version.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --profile 'release' --verbose @install
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
