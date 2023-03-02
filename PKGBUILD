# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_inline_test'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='4'
epoch='1'
pkgdesc='Syntax extension for writing in-line tests in ocaml code'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-base>=0.15.0' 'ocaml-time_now>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-remove-ppxlib-file_path.diff::$url/commit/99e6e5819118c3ebf06bccc879a15175b9221148.diff"
)
sha512sums=('04ea3bc4fc86881d8df50340d5684b8167063293cf0eb0b2c041a6416897d878df22422ea0b8171533dfbe741d5df53a4a9d250370e36a6c7a0a27816b9d3abe'
            '118d09d61cfdcd083d47580725bae57c3242b9dd77235b32acf15a99bbd83f94c268b1a5085bb09449ca65af11c294415c0405d1c4abdd7487e937a3a063cd02')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-remove-ppxlib-file_path.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails with "Error: No rule found for test/inline_tests_runner" and "Error: No rule found for test/inline_tests_runner.exe"
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
