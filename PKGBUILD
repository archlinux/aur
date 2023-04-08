# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='luv'
pkgname="ocaml-$_projectname"
pkgver='0.5.12'
pkgrel='1'
pkgdesc='Cross-platform asynchronous I/O and system calls'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/aantron/$_projectname"
license=('MIT')
depends=('libuv' 'ocaml>=4.03.0' 'ocaml-compiler-libs' 'ocaml-ctypes>=0.14.0' 'ocaml-stdlib-shims')
makedepends=('dune>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9d3b54c43e4b55d41576d8639aacfb170f5749d48caf545decfa43aac5c39621a1e9b9bf8709c23edce3cdfe33534f226abdd86543984448483a1679a362ef71')

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
