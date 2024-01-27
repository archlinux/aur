# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mew'
pkgname="ocaml-$_projectname"
pkgver='0.1.0'
_commit='e2a5ca84d9c3c4142a47ef867b2bbc44083246c5'
pkgrel='8'
pkgdesc='A general modal editing engine generator'
arch=('x86_64' 'aarch64')
url="https://github.com/kandu/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-result' 'ocaml-trie')
makedepends=('dune>=1.1.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha512sums=('SKIP')
validpgpkeys=('364216C4466A9E17A97CD5DBEECA66966D9E4261') # ZAN DoYe <zandoye@gmail.com> (https://github.com/kandu.gpg)

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
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
