# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='protocol_version_header'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Protocol aware version negotiation library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-core>=0.17.0' 'ocaml-ppx_jane>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('cff78b7fa842b2642a6b3f997cab8072868c51898a920792ba644dfdbadb28933b663d71ed7c6ddfc586b65b0cd9c1b90f554c82a2742435d39ed025e286f1c3')

_sourcedirectory="$_projectname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
