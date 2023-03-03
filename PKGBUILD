# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='ppx_bench'
pkgname="ocaml-$_projectname"
pkgver='0.15.0'
pkgrel='4'
epoch='1'
pkgdesc='Syntax extension for writing in-line benchmarks in ocaml code'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-ppx_inline_test>=0.15.0' 'ocaml-ppxlib>=0.23.0')
makedepends=('dune>=2.0.0')
options=('!strip')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$pkgname-$epoch:$pkgver-$pkgrel-remove-ppxlib-file_path.diff::$url/commit/ce7bcca13aff40dd667e231fc0892c8753d0fc94.diff"
)
sha512sums=('f3ab84c7c820735c429ae2250462226efc61d7099071a91dd9471d2052b807dca57c07661336d7f908e2104c1bc0095512429865b2528749cbc407e314e845df'
            '267853da56f801ba3f4c32b94409489cbd32a4317947b220c7f4c98e19a044aa0eb0d14b5e4aa1c4380057aeaff938d2c2c2a2132429277b6cb4f37011ec5ad6')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "../$pkgname-$epoch:$pkgver-$pkgrel-remove-ppxlib-file_path.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
