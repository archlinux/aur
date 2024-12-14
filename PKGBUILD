# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='qcheck'
pkgname="ocaml-$_projectname"
pkgver='0.23'
pkgrel='1'
pkgdesc='QuickCheck inspired property-based testing for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$_projectname"
license=('BSD-2-Clause')
depends=('ocaml>=4.08.0' 'ocaml-alcotest>=1.2.0' 'ocaml-ounit>=2.0.0' 'ocaml-ppx_deriving>=5.2.1' 'ocaml-ppxlib>=0.22.0')
makedepends=('dune>=2.8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0116d764817eac0c8f1a3875cef0df4dba376237216bd1a562940dd060cec729121f1a520ef85395f516f24fca8a62e6ff901d43b74d58d5777ef6e98aebd887')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	ALCOTEST_COLUMNS='80' dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
