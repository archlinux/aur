# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.28.0'
pkgrel='1'
pkgdesc='Standard library for ppx rewriters'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=('ocaml>=4.04.1' 'ocaml-compiler-libs-repackaged>=0.11.0' 'ocaml-ppx_derivers>=1.0.0' 'ocaml-sexplib0>=0.12.0' 'ocaml-stdlib-shims')
makedepends=('dune>=2.7.0')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c95a929254e6a159659c2629708714884db4ca4c9310ee9ab64e48ab56c3a3b2328f205af27bfda29e61f2fd61c3525a8cacd27f603d9bc79b8c8bc5e8404d49')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# fails because of a circular dependency on this package by ppx_jane
# $pkgname-$pkgver-$pkgrel-fix-tests.diff::https://github.com/ocaml-ppx/ppxlib/pull/111
# check() {
#	cd "$srcdir/$_sourcedirectory/"
#	dune runtest --release --verbose
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
