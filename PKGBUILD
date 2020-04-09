# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=('ocaml-atd' 'ocaml-atdgen')
_oname=atd
pkgver=2.2.0
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/mjambon/atd"
license=('BSD')
depends=('ocaml>=3.11'
	 'ocaml-menhir'
	 'ocaml-easy-format'
	 'ocaml-biniou'
	 'ocaml-yojson'
	 'ocaml-re')
makedepends=('ocaml-findlib' 'dune' 'opam' 'scala')
options=(!strip)
source=("https://github.com/mjambon/${_oname}/archive/${pkgver}.tar.gz")
md5sums=('316d541f4a58ae8558b4cd52234fee05')
_dune="dune $(getopt "j::" $MAKEOPTS 2>/dev/null | sed 's/--/\n/g' | head -n 1)"

prepare() {
	cd $srcdir/$_oname-$pkgver
	truncate -s 0 atds/test/run_test.sh
	echo "#!/bin/sh" >> atds/test/run_test.sh
}

build() {
	cd $srcdir/$_oname-$pkgver
	$_dune build 
}

check() {
	cd $srcdir/$_oname-$pkgver
	$_dune runtest
}

package_ocaml-atd() {
	# options and directives that can be overridden
	pkgdesc="Adaptable type definitions for OCaml"

	cd $srcdir/$_oname-$pkgver
	opam-installer --prefix=$pkgdir/usr \
		--libdir $pkgdir$(ocamlfind printconf destdir) \
		--docdir $pkgdir/usr/share/doc atd.install
	
	mv $pkgdir/usr/share/doc/atd $pkgdir/usr/share/doc/$pkgname
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	mv $pkgdir/usr/share/doc/$pkgname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
}

package_ocaml-atdgen() {
	# options and directives overrides
	pkgdesc="Efficient JSON serializer, deserializer and validator generator for OCaml"
	depends=('ocaml-atd' 'bash')

	cd $srcdir/$_oname-$pkgver
	opam-installer --prefix=$pkgdir/usr \
		--libdir $pkgdir$(ocamlfind printconf destdir) \
		--docdir $pkgdir/usr/share/doc atdgen.install
	
	mv $pkgdir/usr/share/doc/atdgen $pkgdir/usr/share/doc/$pkgname
	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	mv $pkgdir/usr/share/doc/$pkgname/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/
}
