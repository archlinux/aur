# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='wtf8'
pkgname="ocaml-$_projectname"
pkgver='1.0.2'
pkgrel='11'
pkgdesc='An ocaml library that implements a WTF-8 encoder and decoder'
arch=('x86_64' 'aarch64')
url="https://github.com/flow/$pkgname"
license=('MIT')
depends=('ocaml>=4.01.0')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('008a70d0e36038a6b8d19763deda15add10c3a0016bb1349b0cb13331cccccc9a8c811a5d6cfbbfb7256b76af62c789c6e0c00392363b5671ff0f41c80615305')

_sourcedirectory="$pkgname-$pkgver"

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
