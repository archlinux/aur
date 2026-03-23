# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

_projectname='ppxlib'
pkgname="ocaml-$_projectname"
pkgver='0.38.0'
pkgrel='1'
epoch='1'
pkgdesc='Utilities for working with Jane Street AST constructs'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-ppx/$_projectname"
license=('MIT')
depends=(
    'glibc'
    'ocaml-base>=0.15.0'
    'ocaml-cmdliner>=1.3.0'
    'ocaml-compiler-libs-repackaged>=0.11.0'
    'ocaml-ppx_derivers>=1.0.0'
    'ocaml-sexplib0>=0.15.0'
    'ocaml-yojson'
    'ocaml>=4.10.0'
    'zstd'
)
makedepends=('dune>=3.8.0')
#checkdepens=('ocaml-cinaps')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-stdlib-shims-dep.diff'
)
b2sums=('d5504fddd17d39f6e633c5b3b41d9ceead884925265b3bf6fb4ed80bfa99201d18ffcf9030bb6be30f5bbe2c8a664329ea01a7c0cc32c3b08043145d9fbf2f90'
        '4cf15c42b407b0aaabae83c587fbd1bad451bf7bbe5a179852adea8f287c577c0fc9f576f19953438ddbd6f7c02b41c7631ddfc9aa8e52e601bd765dd66c34b5')

_sourcedirectory="$_projectname-$pkgver"

prepare()
{
	cd "$srcdir/$_sourcedirectory/"

	# Remove stdlib-shims dependency, as we're always running on OCaml >= 4.08.0
	patch --forward -p1 < '../remove-stdlib-shims-dep.diff'
}

build()
{
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

# Fails because of a circular dependency on this package by ppx_jane and ocaml-cinaps
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	dune runtest --release --verbose
# }

package()
{
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install \
	       --prefix '/usr' \
	       --libdir '/usr/lib/ocaml' \
	       --docdir '/usr/share/doc/ocaml' \
	       --mandir '/usr/share/man' \
	       --release \
	       --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
