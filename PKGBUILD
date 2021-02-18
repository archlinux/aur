# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='luv'
pkgname="ocaml-$_projectname"
pkgver='0.5.7'
pkgrel='1'
pkgdesc='Cross-platform asynchronous I/O and system calls'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/aantron/$_projectname"
license=('MIT')
depends=('libuv' 'ocaml>=4.02.0' 'ocaml-ctypes>=0.13.0' 'ocaml-result')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-no-vendored-libuv-headers.diff::$url/commit/2b009466670799b79c47f61f8d2f5e6c04448572.diff"
)
sha256sums=('09b7785cc64f6de465a50d8af54e4ace4c52b23d929a45f5044e7c9942a2558a'
            '86f2fbad97e40dec16de0ff15d159bbce38a6cecf6eab1533da1b7c4c3aa481d')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# https://github.com/aantron/luv/commit/2b009466670799b79c47f61f8d2f5e6c04448572
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-no-vendored-libuv-headers.diff"

	# Remove folder with tests, as we don't run them anyway and they contain additional opam files,
	# which would otherwise get built
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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -r "$pkgdir/usr/doc/"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
