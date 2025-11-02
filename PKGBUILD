# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='uucp'
pkgname="ocaml-$_projectname"
pkgver='17.0.0'
pkgrel='1'
pkgdesc='Unicode character properties for OCaml'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.14.0' 'ocaml-cmdliner>=1.1.0' 'ocaml-uucd>=17.0.0' 'ocaml-uunf>=17.0.0')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.1.0' 'opam')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('bf9912a19d18d2da9520c41b18f036f94686fdcbab0a8baf6a48b9f2ae5b723ec5a81da163d5009998fbe7d90fdbc2c3201e2381d631b6809e2738615dbf101e')

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
