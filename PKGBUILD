# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>
_projectname='lambda-term'
pkgname="ocaml-$_projectname"
pkgver='3.0.0'
pkgrel='2'
pkgdesc='Terminal manipulation library for OCaml'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('BSD')
depends=('ocaml>=4.02.3' 'ocaml-camomile>=1.0.1' 'ocaml-lwt>=4.0.0' 'ocaml-lwt_log' 'ocaml-mew_vi>=0.4.0' 'ocaml-react' 'ocaml-zed>=3.0.0')
makedepends=('dune>=1.1.0')
options=('!strip')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-vi-visual-mode.diff::$url/commit/e7b8cc0f09b7caf1d03bd512e2f081c78e29e688.diff"
	"$pkgname-$pkgver-$pkgrel-fix-tests.diff::$url/commit/105a1460b41b6c3f0c3d0c9dc260e0a50b13f7c9.diff"
)
sha256sums=('65e16c9a52fa03a6b3a3772566414b0d35cadceac3f244301ef56dad4c6ccc18'
            'd75ce1747c065c1207174c1f43381c0310810917787901d557b8336f779cba34'
            '04b2ca408fe9b0b3ebd52edea79588ed36838fb5220f9256a6805c2def102c3d')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-fix-vi-visual-mode.diff"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-fix-tests.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' -p "$_projectname" --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	mv "$pkgdir/usr/man/" "$pkgdir/usr/share/man/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
