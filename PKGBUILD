# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Daniel Peukert <daniel@peukert.cc>

_projectname='logs'
pkgname="ocaml-${_projectname}_lwt"
pkgver='0.10.0'
pkgrel='1'
pkgdesc='Logging infrastructure for OCaml - with the Logs_lwt library included'
arch=('x86_64' 'aarch64')
url="https://erratique.ch/software/$_projectname"
license=('ISC')
depends=(
    'ocaml-cmdliner'
    'ocaml-fmt'
    'ocaml-lwt'
    'ocaml>=4.03.0'
)
makedepends=(
    'ocaml-findlib'
    'ocaml-topkg>=1.0.3'
    'ocamlbuild'
    'opam'
)
provides=("ocaml-$_projectname=$pkgver")
conflicts=("ocaml-$_projectname")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbuenzli/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('c9a5ef28829df8468df179219f6ab4f1cdf830088fe5825cbdaa5ef636a21a461159c8ae331dcaacfba948aa10aae056843af030e02200b6bf0da21fde2000a6')

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
	ocaml 'pkg/pkg.ml' build \
	      --with-base-threads true \
	      --with-cmdliner true \
	      --with-lwt true \
	      --with-fmt true \
	      --with-js_of_ocaml-compiler false
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	opam-installer \
	    --prefix="$pkgdir/usr" \
	    --libdir='lib/ocaml' \
	    --docdir='share/doc'

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml-$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
