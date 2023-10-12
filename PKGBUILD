# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snmpb
pkgver=1.0
pkgrel=7
pkgdesc="SnmpB is a desktop SNMP browser and MIB editor written in Qt."
arch=('x86_64')
url="https://sourceforge.net/projects/snmpb/"
license=('GPL2')
depends=(qwt qt5-base qt5-svg)
makedepends=(bison flex git)
source=("$pkgname-code::git+https://git.code.sf.net/p/snmpb/code"
	"https://www.ibr.cs.tu-bs.de/projects/libsmi/download/libsmi-0.5.0.tar.gz"
	"https://github.com/libtom/libtomcrypt/releases/download/v1.18.2/crypt-1.18.2.tar.xz"
	"https://sourceforge.net/projects/qwt/files/qwt/6.2.0/qwt-6.2.0.tar.bz2")
sha256sums=('SKIP'
            'f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3'
            '96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84'
            '9194f6513955d0fd7300f67158175064460197abab1a92fa127a67a4b0b71530')

prepare() {
	mkdir -p $pkgname-$pkgver
	cp -r $pkgname-code/{app,snmp++,license.txt,Makefile} $pkgname-$pkgver

	# Copy needed Libs
	cp -r "$srcdir"/libsmi-0.5.0 $pkgname-$pkgver/libsmi
	cp -r "$srcdir"/libtomcrypt-1.18.2 $pkgname-$pkgver/libtomcrypt
	cp -r "$srcdir"/qwt-6.2.0 $pkgname-$pkgver/qwt

	# Include QwtScaleWidget
	sed "30i#include <qwt_scale_widget.h>" -i $pkgname-$pkgver/app/graph.cpp
	sed "31i#include <qwt_scale_widget.h>" -i $pkgname-$pkgver/app/graph.h
}

build() {
	cd $pkgname-$pkgver

	# Libsmi
	cd libsmi
	./configure --disable-shared --disable-yang \
		--with-pathseparator=";" --with-dirseparator="/" \
		--with-smipath="/usr/share/apps/snmpb/mibs;/usr/share/apps/snmpb/pibs"
	make V=0

	# Libtomcrypt
	cd ../libtomcrypt
	make library

	# Qwt
	cd ../qwt
	qmake-qt5 qwt.pro
	make

	# Build snmpb Qt App
	cd ../app
	qmake-qt5 -o makefile.snmpb snmpb.pro
	make -f makefile.snmpb
}

package() {
	# Install package
	cd "$srcdir"/$pkgname-$pkgver
	make INSTALL_PREFIX="$pkgdir"/usr install

	# Install license files
	install -Dvm644 "$srcdir"/$pkgname-$pkgver/license.txt \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	# User config files stored in
	# $HOME/.config/snmpb.sourceforge.net

	# Default dirs for MIBs/PIBs:
	# /usr/share/apps/snmpb/mibs
	# /usr/share/apps/snmpb/pibs
}
