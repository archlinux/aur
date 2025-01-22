# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='ppx_ignore_instrumentation'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Ignore Jane Street specific instrumentation extensions'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-ppxlib>=0.28.0' 'zstd')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0502380f0d26f740f8f2bebeb1dd16087e6f10041468fb805e4d5062cf0dd0583278b5f5ba75c834f40a90735c9c723f70a1fa479836819bd0cc60e969ec45fb')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# No tests available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
