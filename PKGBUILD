# Maintainer: Marco Schulze <aur@ereski.org>
# Contributor: TuxSpirit<tuxpsiritATarchlinuxDOTfr>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>


pkgname=zpaq
pkgdesc='Programmable file compressor, library and utilities. Based on the PAQ compression algorithm'
url='http://mattmahoney.net/dc/zpaq.html'
pkgver=7.10
pkgrel=1

_zpaq_ver=710

arch=(i686 x86_64)
license=(custom MIT)
makedepends=(perl)

source=(http://mattmahoney.net/dc/zpaq${_zpaq_ver}.zip)
sha512sums=('f8c3ac8c6f1b69f1fb22b107314496a1bdcda24b81b23d429bda1702a38dfee48010168234fcd1775e5064e65a963df1434514429f7aff04c26943d520ebd447')

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
