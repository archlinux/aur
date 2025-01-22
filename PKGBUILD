# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='duration'
pkgname="ocaml-$_projectname"
pkgver='0.2.1'
pkgrel='3'
pkgdesc='Conversions to various time units for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/hannesm/$_projectname"
license=('ISC')
depends=('ocaml>=4.04.2')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('9a6a4f0b5f924e05b9e571097d294dcb98516325311ec9d405cb3330556a8c8d632c317e10dfb4af71bccc34efb503e219e9a9b600f7a43726a6f5e5ea5400ae')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because of a circular dependency on ocaml-alcotest

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
