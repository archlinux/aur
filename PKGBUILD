# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lance Roy <ldr709@gmail.com>
_projectname='core_unix'
pkgname="ocaml-$_projectname"
pkgver='0.16.0'
pkgrel='1'
epoch='1'
pkgdesc='Unix-specific extensions to some of the modules defined in ocaml-core and ocaml-core_kernel'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.14.0' 'ocaml-core>=0.16.0' 'ocaml-core_kernel>=0.16.0' 'ocaml-expect_test_helpers_core>=0.16.0' 'ocaml-intrinsics>=0.16.0' 'ocaml-jane-street-headers>=0.16.0' 'ocaml-jst-config>=0.16.0' 'ocaml-ppx_jane>=0.16.0' 'ocaml-ppx_optcomp>=0.16.0' 'ocaml-sexplib>=0.16.0' 'ocaml-spawn>=0.15.0' 'ocaml-timezone>=0.16.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e38a126af832360f0e0079919b930f3fa99b02935c35372b1ed8c7e174af335de2f4dcb8da90be8f9f524542752dd5c62ec6192eb327d7cc6313b7402b0f7f65')

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
