# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_oname='javalib'
pkgname="ocaml-$_oname"
pkgver='2.3.4'
pkgrel=3
pkgdesc="Parses Java .class files into OCaml data structures"
arch=('i686' 'x86_64')
url="http://sawja.inria.fr/"
license=('LGPL2')
depends=('ocaml>=4.0.0' 'ocaml-extlib>=1.5.1' 'ocaml-zip>=1.04' 'zlib')
makedepends=('ocaml-findlib')
options=(!strip)
changelog=
source=("https://gforge.inria.fr/frs/download.php/file/37154/$_oname-$pkgver.tar.bz2")
md5sums=('4707eda130e41d1d7f0506cc0c77eff1')

prepare() {
	cd "$_oname-$pkgver"
	sed -i 's,OCAMLPATH=$(LOCALDEST)'",OCAMLPATH=$srcdir/$_oname-$pkgver,g" Makefile.config.example
	sed -i 's,INSTALL = $(FINDER) install,INSTALL = $(FINDER) install'" -destdir $pkgdir/usr/lib/ocaml," Makefile.config.example
	sed -i "s,^OCAMLPATH=,export OCAMLPATH=$srcdir/$_oname-$pkgver," configure.sh
}

build() {
	cd "$_oname-$pkgver"
	DESTDIR=/usr ./configure.sh
	make ptrees
	DESTDIR=/usr ./configure.sh
	make
}

package() {
	cd "$_oname-$pkgver"
	mkdir -p $pkgdir/usr/lib/ocaml
	make installptrees
	make install
}
