# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='dune'
pkgname="$_projectname-private-libs"
pkgver='2.5.1'
pkgrel='1'
pkgdesc='Private libraries of Dune'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml/$_projectname"
license=('MIT')
depends=('ocaml>=4.07.0' "dune=$pkgver")
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a4ba5947f7eff80043b3394a6afde32f6e37e82a06e6a0a3b68e2761389ac861')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$pkgname" --verbose
}

# fails with "No rule found for alias .dune-{files,build-info-files,configurator-files}"
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest -p "$pkgname" --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' -p "$pkgname" --verbose "$pkgname"

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$pkgname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
