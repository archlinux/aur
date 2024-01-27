# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uunf'
pkgname="ocaml-$_projectname"
pkgver='15.1.0'
pkgrel='1'
pkgdesc='Unicode text normalization for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.14.0' 'ocaml-cmdliner>=1.1.O' 'ocaml-uucd>=15.1.0' 'ocaml-uutf>=1.0.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
sha512sums=('b24bc1e4172332a20085992614ada370d0f48c650e892d76285f7f8eac3047459693e094fb5e5a0f758a791863427d46c2b11008818924d281fe19fc2ea17d88')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-cmdliner true --with-uutf true
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
