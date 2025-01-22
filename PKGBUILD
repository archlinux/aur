# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='async_unix'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Monadic concurrency library for OCaml (Unix-related dependencies)'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-async_kernel>=0.17.0' 'ocaml-core>=0.17.0' 'ocaml-core_kernel>=0.17.0' 'ocaml-core_unix>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-ppx_optcomp>=0.17.0' 'ocaml-cstruct>=6.0.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('df87ae470ba5f990bcb99a243e04b2d129caf962bea38aed4801dab7a3b6a22096420b3c38bfee13c2b6d474c1647be8ed05720b5b49267a910adefad494e3b3')

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
