# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sean Anderson <seanga2@gmail.com>
_oname='javalib'
pkgname=ocaml-$_oname
pkgver=3.2.1
pkgrel=4
pkgdesc="Parses Java .class files into OCaml data structures"
arch=('i686' 'x86_64')
url="https://github.com/javalib-team/javalib/"
license=('LGPL2')
depends=('ocaml>=4.0.0' 'ocaml-extlib>=1.5.1' 'ocaml-zip>=1.04' 'zlib')
makedepends=('ocaml-findlib')
options=(!strip)
changelog=
source=("https://github.com/javalib-team/$_oname/archive/v$pkgver.tar.gz")
md5sums=('0970ddb7c418f6b16184a329e49ba31c')

prepare() {
	cd "$_oname-$pkgver"
	sed -i 's,OCAMLPATH=$(LOCALDEST)'",OCAMLPATH=$srcdir/$_oname-$pkgver,g" Makefile.config.example
	sed -i 's,INSTALL = $(FINDER) install,INSTALL = $(FINDER) install'" -destdir $pkgdir/usr/lib/ocaml," Makefile.config.example
	sed -i "s,^OCAMLPATH=,export OCAMLPATH=$srcdir/$_oname-$pkgver," configure.sh
}

build() {
	cd "$_oname-$pkgver"
	DESTDIR=/usr ./configure.sh
	make
}

package() {
	cd "$_oname-$pkgver"
	mkdir -p $pkgdir/usr/lib/ocaml
	make install
}
