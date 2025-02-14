# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='mtime'
pkgname="ocaml-$_projectname"
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Monotonic wall-clock time for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.08.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('0fc3355efa5ae555710a22ae394cefacbe14cc213b0c619fbe94b1b0fd0eac11fce518c34dbab4bff3c961541ee6bf72a0a74358b5f7e276a57b446bc0d7fd76')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer --prefix="$pkgdir/usr" --libdir='lib/ocaml' --docdir='share/doc'

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml-$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
