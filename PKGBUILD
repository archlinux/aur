# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_bench'
pkgname="ocaml-$_projectname"
pkgver='0.14.1'
pkgrel='1'
epoch='1'
pkgdesc='Syntax extension for writing in-line benchmarks in ocaml code'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-ppx_inline_test>=0.14.0' 'ocaml-ppxlib>=0.14.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'invalid-dune-project.diff'
)
sha256sums=('b8b8c3e8d990eb93d9b196ed5bd2315454dca2ae0abd05b07075737aa8b1aa60'
            '21327b5018b0c63dbd3dfedc3d19fafe6cc338824f3cff92818a56951c2ab766')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../invalid-dune-project.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
