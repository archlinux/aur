# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Maintainer: Lance Roy <ldr709@gmail.com>
_projectname='ocaml_intrinsics'
pkgname='ocaml-intrinsics'
pkgver='0.17.0'
pkgrel='4'
epoch='1'
pkgdesc='Library of intrinsics for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-intrinsics-kernel>=0.17.0' 'dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('db536481d58851dbb96a1dc9070cc680fd558279c88ddce0176d168660be6dc8ee1bb7b67f877132163077c96773dad4b4c36c25db664511e833e0d5563ef4f9')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Tests currently don't run with runtest (https://github.com/janestreet/ocaml_intrinsics/issues/9)

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/$(basename "$_folder" | tr '_' '-')"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
