# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='ppxfind'
pkgname="ocaml-$_projectname"
pkgver='1.4'
pkgrel='1'
pkgdesc='Tool combining ocamlfind and ppx'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/diml/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-findlib' 'ocaml-migrate-parsetree')
makedepends=('dune' 'ocaml-findlib')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'dune-version.diff'
)
sha256sums=('49e2f5cb7fb31e8fc2d482097d1bc96c8915ab50ea37133366da03a9a5ca3604'
            '5c589918a6f98fbb962590276629e4639037c02aaabdb10f5ec18b40ee2767c2')

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
