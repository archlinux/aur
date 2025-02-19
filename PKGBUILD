# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='hmap'
pkgname="ocaml-$_projectname"
pkgver='0.8.1'
_commit='e54eb3f7d7dbada0724fd023c334d0b5a29c8479'
pkgrel='1'
pkgdesc='Heterogeneous value maps for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.02.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/$_commit.tar.gz")
b2sums=('8622c4b8dbd06314c3530d66a08eb6e4e6d840ac5381234e93f555d0f7cbaa739aa413b23d1479c26a8b273effe8167785dbd5b9426f609804338b7db5e24b99')

_sourcedirectory="$_projectname-$_commit"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%NAME%%/$_projectname/g" {} +
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
	find . -type f -exec sed -i "s|%%PKG_HOMEPAGE%%|$url|g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --tests true
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc/ocaml'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
