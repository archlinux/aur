# Maintainer: Gary Hunt <garysERASE_THIS_PARTboxATgmailonedotcom>
# Contributor James G.
pkgname=tinyfugue-rebirth
pkgver=5.1.6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="flexible, screen-oriented MUD client, with python,lua,atcp,gmcp and option102 support"
url="http://https://github.com/ingwarsw/tinyfugue"
license=("GPL")
depends=(pcre zlib ncurses openssl lua51 python)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ingwarsw/tinyfugue/archive/refs/tags/$pkgver.tar.gz"
	"python_3.13_fix.patch"
)

prepare() {
	patch -d tinyfugue-$pkgver -Np1 -i ../python_3.13_fix.patch
}

# build function
build() {
	cd $srcdir/tinyfugue-$pkgver
	CFLAGS="$CFLAGS $(INCLUDE)-D_GNU_SOURCE -Wno-error=return-mismatch -Wno-error=implicit-function-declaration -Wno-error=int-conversion -Wno-error=incompatible-pointer-types" ./configure --enable-atcp --enable-gmcp --enable-option102 --enable-python --enable-termcap=ncurses --enable-lua --bindir=/usr/bin/ --datarootdir=/usr/share 
	make
}

# package function, cleanup
package() {
	
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/tinyfuge-rebirth
	mkdir -p $pkgdir/usr/share/tf-lib/
	cd $srcdir/tinyfugue-$pkgver
	cp src/tf $pkgdir/usr/bin/
	cd lib/
	cp tf/* $pkgdir/usr/share/tf-lib/
	cp lua/* $pkgdir/usr/share/tf-lib/
	cp py/* $pkgdir/usr/share/tf-lib/
}
sha256sums=('891aae175499ae53a94b7287e333157c8dd556c23e56bba8dbe578649ab94f66'
	    '38cc829a137512cae995c50dede61b85245a934a978bf89a80528765c98d9c6c')
