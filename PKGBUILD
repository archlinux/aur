# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='duration'
pkgname="ocaml-$_projectname"
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Conversions to various time units for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/hannesm/$_projectname"
license=('ISC')
depends=('ocaml>=4.04.2')
makedepends=('dune>=1.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('36a2944e72ffcc8b3ae64a2a2c80382833a09cdf24e224c13deb645a0295c333bd8e2a22a1375691f7bb5021d7fa3ac1620e90c59a3d17fdd7eb5ff7853ebf74')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
