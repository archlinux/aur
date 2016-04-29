# Maintainer: Marco Schulze <aur@ereski.org>
# Contributor: TuxSpirit<tuxpsiritATarchlinuxDOTfr>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>


pkgname=zpaq
pkgdesc='Programmable file compressor, library and utilities. Based on the PAQ compression algorithm'
url='http://mattmahoney.net/dc/zpaq.html'
pkgver=7.12
pkgrel=1

_zpaq_ver=712

arch=(i686 x86_64)
license=(custom MIT)
makedepends=(perl)

source=(http://mattmahoney.net/dc/zpaq${_zpaq_ver}.zip)
sha512sums=('a94753f4374cfe1ce294224a2ca7e0c4a02d7ae57eaefc1606fedcd61b5cfa868e100abae0f7e343527223cf87325486699c6812d44dde8ccc22c61cf30e2033')

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
