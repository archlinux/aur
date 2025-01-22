# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='logs'
pkgname="ocaml-${_projectname}_lwt"
pkgver='0.7.0'
pkgrel='4'
pkgdesc='Logging infrastructure for OCaml - with the Logs_lwt library included'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=('ocaml>=4.03.0' 'ocaml-cmdliner' 'ocaml-fmt' 'ocaml-lwt')
makedepends=('ocamlbuild' 'ocaml-findlib' 'ocaml-topkg>=1.0.3' 'opam')
provides=("ocaml-$_projectname=$pkgver")
conflicts=("ocaml-$_projectname")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('065a0456d335cf75339272a2a504c94c08223e09202c743044e42d247f73d3a8529b0725ab503c8be358195177dabdd1185741207ed9d189184a960d0263a029')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace topkg watermarks
	find . -type f -exec sed -i "s/%%NAME%%/$_projectname/g" {} +
	find . -type f -exec sed -i "s/%%\(VERSION\|VERSION_NUM\)%%/$pkgver/g" {} +
	find . -type f -exec sed -i "s|%%PKG_HOMEPAGE%%|$url|g" {} +
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	ocaml 'pkg/pkg.ml' build --with-base-threads true --with-cmdliner true --with-lwt true --with-fmt true --with-js_of_ocaml false
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
