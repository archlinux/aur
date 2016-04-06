# Maintainer: Marco Schulze <aur@ereski.org>
# Contributor: TuxSpirit<tuxpsiritATarchlinuxDOTfr>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>


pkgname=zpaq
pkgdesc='Programmable file compressor, library and utilities. Based on the PAQ compression algorithm'
url='http://mattmahoney.net/dc/zpaq.html'
pkgver=7.09
pkgrel=1

_zpaq_ver=709

arch=(i686 x86_64)
license=(custom MIT)
makedepends=(perl)

source=(http://mattmahoney.net/dc/zpaq${_zpaq_ver}.zip)
sha512sums=('06bf03776a3b6f4eef28a71f8079a6593eebd6a289764e7252be884613b6ea4ac946b8f4098e8e66f5cdff6bf5ea3a5bf4dc8f9689cc98b4b55788a07a0bcd70')

build()
{
	cd "$srcdir"

	if [ -z "$CC" ]
	then
		CC=gcc
	fi
	if [ -z "$CXX" ]
	then
		CXX=g++
	fi

	msg 'Building libzpaq'
	$CXX $CXXFLAGS $LDFLAGS -fPIC -shared -Dunix -DNDEBUG libzpaq.cpp -o libzpaq.so

	msg 'Building zpaq'
	$CXX ${CXXFLAGS/-flto} ${LDFLAGS/-flto} -pthread -Dunix -DNDEBUG zpaq.cpp -L. -lzpaq -o zpaq

	msg 'Building man page'
	pod2man zpaq.pod zpaq.1
	gzip -9 zpaq.1
}


package()
{
	install -Dm 644 libzpaq.h  "$pkgdir/usr/include/libzpaq.h"
	install -Dm 644 libzpaq.so "$pkgdir/usr/lib/libzpaq.so"
	install -Dm 755 zpaq       "$pkgdir/usr/bin/zpaq"
	install -Dm 644 zpaq.1.gz  "$pkgdir/usr/share/man/man1/zpaq.1.gz"
	install -Dm 644 COPYING    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
