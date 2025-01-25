# Maintainer: dringsim <dringsim@qq.com>
pkgname="ocaml-base64"
pkgver='3.5.1'
pkgrel='1'
pkgdesc='Base64 encoding for OCaml'
arch=('x86_64')
url="https://github.com/mirage/ocaml-base64"
license=('ISC')
depends=('ocaml>=4.03.0')
makedepends=('dune>=2.3')
checkdepends=('ocaml-fmt>=0.8.7' 'ocaml-bos' 'ocaml-rresult' 'ocaml-alcotest')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('F3E8B9BE43567689064B419FA5EEFD9C758F00B864E9F731A0DBC1B9FECFC768')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
