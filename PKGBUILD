# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_custom_printf'
pkgname="ocaml-$_projectname"
pkgver='0.14.0'
pkgrel='3'
epoch='1'
pkgdesc='Printf-style format-strings for user-defined string conversion'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.2' 'ocaml-base>=0.14.0' 'ocaml-ppx_sexp_conv>=0.14.0' 'ocaml-ppxlib>=0.18.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-ppxlib-compat.diff::$url/commit/d415134eb9851e0e52357046f2ed642dfc398ba3.diff"
)
sha256sums=('c527d5a578a0d6b21a38480b4360b402a27cfcc3361a4092bee16800bf8102d7'
            '30ad085004b3a29275b87276206ae00e194335e7d9f11f7af689e36549a95f43')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# https://github.com/janestreet/ppx_custom_printf/pull/9
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-fix-ppxlib-compat.diff"
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
