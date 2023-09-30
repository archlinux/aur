# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snmpb
pkgver=1.0
pkgrel=5
pkgdesc="SnmpB is a desktop SNMP browser and MIB editor written in Qt."
arch=('x86_64')
url="https://sourceforge.net/projects/snmpb/"
license=('GPL2')
makedepends=(bison flex qt5-base git)
source=("$pkgname-code::git+https://git.code.sf.net/p/snmpb/code"
	"git+https://gitlab.ibr.cs.tu-bs.de/nm/libsmi.git"
	"libtomcrypt-1.18.2.tar.gz::https://github.com/libtom/libtomcrypt/archive/refs/tags/v1.18.2.tar.gz"
	"qwt-6.2.0.zip::https://sourceforge.net/projects/qwt/files/qwt/6.2.0/qwt-6.2.0.zip/download")
sha256sums=('SKIP'
            'SKIP'
            'd870fad1e31cb787c85161a8894abb9d7283c2a654a9d3d4c6d45a1eba59952c'
            '3e9632a9be6a883db5c496e42ce74cbbf8da02cc3328faa89e2c43e434a2eb76')

prepare() {
	mkdir -p $pkgname-$pkgver
	cp -r $pkgname-code/{app,snmp++,license.txt,Makefile} $pkgname-$pkgver

	# Copy needed Libs
	cp -r "$srcdir"/libsmi $pkgname-$pkgver/libsmi
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
	./autogen.sh
	./configure --disable-shared --disable-yang \
		--with-pathseparator=";" --with-dirseparator="/" \
		--with-smipath="/usr/share/apps/snmpb/mibs;/usr/share/apps/snmpb/pibs"
	make

	# Libtomcrypt
	cd ../libtomcrypt
	make CPPFLAGS+=" -DLTM_DESC -DGMP_DESC -DUSE_LTM" EXTRALIBS="-ltommath -lgmp" \
		-f makefile.shared library

	# Qwt
	cd ../qwt
	qmake qwt.pro
	make

	# Build snmpb Qt App
	cd ../app
	qmake -o makefile.snmpb snmpb.pro
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
