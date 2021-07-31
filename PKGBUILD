# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mew'
pkgname="ocaml-$_projectname"
pkgver='0.1.0'
pkgrel='4'
pkgdesc='A general modal editing engine generator'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kandu/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-result' 'ocaml-trie')
makedepends=('dune>=1.1.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('64d38ceb52ef574cb314bdd693f7e4a9c9e483e80a58595db22f2df76a8a59e6')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build -p "$_projectname" --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest -p "$_projectname" --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' -p "$_projectname" --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
