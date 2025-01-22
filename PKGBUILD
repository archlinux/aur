# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mirage-clock'
pkgname="ocaml-$_projectname"
pkgver='4.2.0'
pkgrel='3'
pkgdesc='Libraries and module types for portable clocks'
arch=('x86_64' 'aarch64')
url="https://github.com/mirage/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0')
makedepends=('dune>=2.8.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('37c701a92ec8cdf71e9d297ec09992f313f1b3637146988b8fac3e7c6e21be4eb2ebe622fdf1ae52612b2cf51e6cbfa87750c62bf68f126d3e61789d461a4a31')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
