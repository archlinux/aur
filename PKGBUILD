# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uring'
pkgname="ocaml-$_projectname"
pkgver='2.7.0'
pkgrel='1'
pkgdesc='Bindings to io_uring for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$pkgname"
license=('ISC AND (LGPL-2.1-only OR MIT) AND (GPL-2.0-only WITH Linux-syscall-note OR MIT)')
depends=('dune>=3.0.0' 'ocaml>=4.12.0' 'ocaml-cstruct>=6.0.1' 'ocaml-fmt>=0.8.10' 'ocaml-optint>=0.1.0')
makedepends=('linux-api-headers')
checkdepends=('ocaml-cmdliner>=1.1.0' 'ocaml-logs>=0.5.0' 'ocaml-lwt>=5.0.0' 'ocaml-mdx>=2.1.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('05828cfb43493dfc27cc4dc6ee21a24918baf38fb2da7c6bf1639cc121e3c459fcb6defdf289d29f6ff15a4457c4657fefd1093e2175c656eb675a067ab8d6c1')

_sourcedirectory="$pkgname-$pkgver"

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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-uring"
	install -Dm644 "vendor/lib${_projectname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-liburing"
	install -Dm644 "vendor/lib${_projectname}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING-liburing"
	install -Dm644 "vendor/lib${_projectname}/COPYING.GPL" "$pkgdir/usr/share/licenses/$pkgname/COPYING.GPL-liburing"
}
