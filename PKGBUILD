# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_typerep_conv'
pkgname="ocaml-$_projectname"
pkgver='0.14.1'
pkgrel='3'
epoch='1'
pkgdesc='Generation of runtime types from type declarations'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base>=0.14.0' 'ocaml-typerep>=0.14.0' 'ocaml-ppxlib>=0.14.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"ppxlib.diff"
)
sha256sums=('92e58fec59e83b972b53b4c72b1202192beaf83c53560357d05c948e4867dc14'
            'cc1f89a36a0965124b12f732a69a5121b88a0e8148f848c164ca733068c6287b')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../ppxlib.diff'
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
