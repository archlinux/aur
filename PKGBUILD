# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='dune'
pkgname="$_projectname-configurator"
pkgver='2.3.0'
pkgrel='1'
pkgdesc='Helper library for gathering system configuration'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml/$_projectname"
license=('MIT')
depends=('ocaml' 'dune>=2.3' 'dune-private-libs')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c06b73d70c0e539cf46aec0d34bc306ddddb5415f33cff42dc4cc08562be135c')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$pkgname" --verbose
}

# fails with "No rule found for alias .dune-{files,build-info-files}"
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
