# Maintainer: Carol Schulze <aur@ereski.org>
# Contributor: TuxSpirit<tuxpsiritATarchlinuxDOTfr>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>


pkgname=zpaq
pkgdesc='Programmable file compressor, library and utilities. Based on the PAQ compression algorithm'
url='http://mattmahoney.net/dc/zpaq.html'
pkgver=7.15
pkgrel=2

_zpaq_ver=715

arch=(i686 x86_64)
license=(custom MIT)
makedepends=(perl)

source=(http://mattmahoney.net/dc/zpaq${_zpaq_ver}.zip)
sha512sums=('4cddcc04dff5e9dceb7138cf9e82b718b696048368ff494339f877d93e4423ed7959c0cfb2e30ba7dcbcdd6bbd59fa1021ceaca6d51e3180d8034b7a3997c265')

build()
{
	cd "$srcdir"

	if [ -z "$CXX" ]
	then
		CXX=g++
	fi

	msg 'Building libzpaq'
	$CXX $CXXFLAGS $LDFLAGS -fPIC -shared -Dunix -DNDEBUG libzpaq.cpp -o libzpaq.so

	msg 'Building zpaq'
	$CXX $CXXFLAGS $LDFLAGS -pthread -Dunix -DNDEBUG zpaq.cpp -L. -lzpaq -o zpaq

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
