# Maintainer: oech3

pkgname=icu-shim
pkgver=76
pkgrel=1
pkgdesc="(Dangerous) Stupid shim for old icu libraries"
arch=('x86_64')

depends=( icu )
provides=( icu{75..64} )
conflicts=( icu{75..64} )
source=( {data,i18n,io,test,tu,uc}.sh )
sha512sums=( SKIP{,,,,,} )
build() {	
	mkdir -p "{pkgdir}"/usr/lib
	for i in data i18n io test tu uc
	do
		./${i}.sh >shim.c
		gcc -O2 -shared -fPIC -o ${i}.so shim.c -licu${i}
	done
}
package () {
	for i in data i18n io test tu uc
		do install -Dm644 ${i}.so "$pkgdir/usr/lib/libicu${i}.so.64"
		for n in {75..65}
			do ln -sf /usr/lib/libicu${i}.so.64 "${pkgdir}"/usr/lib/libicu${i}.so.$n
		done
	done
}
