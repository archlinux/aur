# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mew_vi'
pkgname="ocaml-$_projectname"
pkgver='0.5.0'
pkgrel='8'
pkgdesc='Vi-like modal editing engine generator'
arch=('x86_64' 'aarch64')
url="https://github.com/kandu/$_projectname"
license=('MIT')
depends=('ocaml>=4.02.3' 'ocaml-mew>=0.1.0' 'ocaml-react')
makedepends=('dune>=1.1.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('30953927947b80391ccff3a7378bfc7d4edcff7164226225c5c1f0fc835312aa31220eedc2e29de663027dd32e316f4ac365494da0893f6d91094f35c036b0db')

_sourcedirectory="$_projectname-$pkgver"

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
