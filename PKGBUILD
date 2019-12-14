# Maintainer: robertfoster
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-camomile
pkgver=1.0.2
pkgrel=2
pkgdesc="Comprehensive Unicode library for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/yoriyuki/Camomile"
license=('LGPL')
makedepends=('dune' 'ocaml' 'ocaml-findlib' 'opam')
source=(https://github.com/yoriyuki/Camomile/archive/$pkgver.tar.gz)
options=(!strip !makeflags staticlibs)

build() {
	cd Camomile-${pkgver}
        find . -name "*.mli" -exec sed -i 's,Pervasives.in_channel,Stdlib.in_channel,g' {} + 
        find . -name "*.mli" -exec sed -i 's,Pervasives.out_channel,Stdlib.out_channel,g' {} +
        find . -name "*.ml" -exec sed -i 's,Pervasives.in_channel,Stdlib.in_channel,g' {} +
        find . -name "*.ml" -exec sed -i 's,Pervasives.out_channel,Stdlib.out_channel,g' {} +
        find . -name "*.ml" -exec sed -i 's,Pervasives.compare,Stdlib.compare,g' {} +
	dune build @install
}

package() {
	cd Camomile-${pkgver}
	
	mkdir -p "$pkgdir"/usr/lib/ocaml
	dune install \
		--destdir="$pkgdir" \
		--libdir="/usr/lib/ocaml"

	cd "$pkgdir"

	# There's just a readme.
	rm -Rf usr/doc

	# Remove annotation files and sources.
	rm -Rf usr/lib/ocaml/$_pkgname/*.cmt*
	rm -Rf usr/lib/ocaml/$_pkgname/*.ml
}

md5sums=('2ec60575e485b0b92f821949a81acb4d')
