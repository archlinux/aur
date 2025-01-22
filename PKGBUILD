# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='dtoa'
pkgname="ocaml-$_projectname"
pkgver='0.3.3'
pkgrel='4'
pkgdesc='double-to-ascii ocaml implementation'
arch=('x86_64' 'aarch64')
url="https://github.com/flow/$pkgname"
license=('MIT')
depends=('ocaml>=4.01.0')
makedepends=('dune>=2.0.0')
checkdepends=('ocaml-ounit>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('514b8f3da2a8f8e362847a6dd006e480a6a4d257db7ec02b3f9bf4959283d99e7d173f2ef3fe7599d6426e44d3263ece568e9c5bb0371dc7d9cd9ccb52735386')

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
