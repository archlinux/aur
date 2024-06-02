# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucp'
pkgname="ocaml-$_projectname"
pkgver='15.1.0'
pkgrel='2'
pkgdesc='Unicode character properties for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.14.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-uucd>=15.1.0' 'ocaml-uunf>=15.1.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('0a10ce405321b3d31e19db8a5a9a3379b2b2e2710dc2e6e2f53e3aab0d9e91d0dfe9cf30652efceb5f189d43da5237b078e4927738afc36a6e1fec8f7aa2782c')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-cmdliner true --with-uunf true
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
