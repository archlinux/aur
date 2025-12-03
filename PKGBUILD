# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Daniel Peukert <daniel@peukert.cc>
_projectname='async'
pkgname="ocaml-$_projectname"
pkgver='0.17.0'
pkgrel='3'
pkgdesc='Monadic concurrency library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=(
    'ocaml>=5.1.0'
    'ocaml-async_kernel>=0.17.0'
    'ocaml-async_log>=0.17.0'
    'ocaml-async_rpc_kernel>=0.17.0'
    'ocaml-async_unix>=0.17.0'
    'ocaml-core>=0.17.0'
    'ocaml-core_kernel>=0.17.0'
    'ocaml-core_unix>=0.17.0'
    'ocaml-ppx_jane>=0.17.0'
    'ocaml-textutils>=0.17.0'
)
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('fa8853a24d251bf5acaf6bff8a1dd115a7c80bf6650f886a70404bd9023495f381ab0cec723d50038e170ba6a0998e8c77066677e20a6047f18b5d44d73355ac')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Not running tests because checkdeps qtest_deprecated and netkit_sockets seem to not be publicly available

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
