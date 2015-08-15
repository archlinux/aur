# Maintainer: Marco Schulze <aur@ereski.org>
# Contributor: TuxSpirit<tuxpsiritATarchlinuxDOTfr>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>


pkgname=zpaq
pkgdesc='Programmable file compressor, library and utilities. Based on the PAQ compression algorithm'
url='http://mattmahoney.net/dc/zpaq.html'
pkgver=7.05
pkgrel=1

_zpaq_ver=705

arch=(i686 x86_64)
license=(custom MIT)
makedepends=(perl)

source=(http://mattmahoney.net/dc/zpaq${_zpaq_ver}.zip
	LICENSE)
sha512sums=('1bcd22524b0433cc35ee28217eec04e1e743ec84e8ec7fe4392eb511873ff5c8571435da081de6b54a9675f206537f5d091a682383c84607905731ee132a9e66'
            '7ae68096163998f926be15c16da9540fa32d052a02d73db10678d965db5dfdf7e958b2d474c509d622056cc844abceda15657f2b0b5e97f6b12cb552185748e4')

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
	install -Dm 644 LICENSE    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
