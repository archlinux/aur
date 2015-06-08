# Maintainer: dobo <dobo90_at_gmail.com>

pkgname=sdlhack
pkgver=1.4
pkgrel=1
pkgdesc='A wrapper for SDL which lets you force fullscreen games to minimize.'
arch=(i686 x86_64)
url=http://jspenguin.org:81/software/sdlhack/
license=(LGPL)
depends=(glibc bash)
[ ${CARCH} = x86_64 ] && depends[0]=lib32-glibc
makedepends=(sdl)
[ ${CARCH} = x86_64 ] && makedepends+=(gcc-multilib)
source=(http://jspenguin.org:81/software/sdlhack/${pkgname}-${pkgver}.tar.gz)
md5sums=(d154bcc2f6e82dad6d5b7fbe7a681115)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	CFLAGS="${CFLAGS} $(sdl-config --cflags) -shared -fPIC -O2 -ldl -Wall"

	gcc -m32 ${CFLAGS} libsdlhack.c -o libsdlhack-i386.so
	if [ ${CARCH} = x86_64 ]; then gcc -m64 ${CFLAGS} libsdlhack.c -o libsdlhack-x86_64.so; fi
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	if [ ${CARCH} = i686 ]; then
		install -D -m 755 libsdlhack-i386.so ${pkgdir}/usr/lib/libsdlhack.so
	else # x86_64
		install -D -m 755 libsdlhack-i386.so ${pkgdir}/usr/lib32/libsdlhack.so
		install -D -m 755 libsdlhack-x86_64.so ${pkgdir}/usr/lib/libsdlhack.so
	fi

	install -D -m 755 sdlhack ${pkgdir}/usr/bin/sdlhack
	install -D -m 644 README ${pkgdir}/usr/share/doc/${pkgname}/README
}
