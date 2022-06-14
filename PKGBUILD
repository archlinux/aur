# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='luv'
pkgname="ocaml-$_projectname"
pkgver='0.5.11'
pkgrel='3'
pkgdesc='Cross-platform asynchronous I/O and system calls'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/aantron/$_projectname"
license=('MIT')
depends=('libuv' 'ocaml>=4.02.0' 'ocaml-ctypes>=0.14.0' 'ocaml-result')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('3034b70935bc1bf1f6c2b7a34b0997ebf91e08e232576c48cc6499c59f2ad611e9c69daf8670f1190d74d2e6956a79ae60aa192e5b9f9041ddd6cc8ff389a903')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove folder with tests, as we don't run them anyway and they contain additional
	# opam files, which would otherwise get built
	rm -rf 'test/'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	LUV_USE_SYSTEM_LIBUV='yes' dune build --release --verbose
}

# Ignoring this for now, as I would have to package ocaml-alcotest and its dependencies
# (about 20 packages) just for this single package, which is not something I want to do
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
