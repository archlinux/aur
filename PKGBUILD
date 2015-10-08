# Maintainer: Ranuka Perera <random -at- sawrc.com>
pkgname=wiringpi-git
_gitname=wiringPi
pkgver=94.d795066
pkgrel=1
pkgdesc="Arduino wiring-like library written in C for RaspberryPi."
url="http://wiringpi.com/"
arch=('armv7h' 'armv6h' 'i686' 'x86_64')
license=('LGPL3')
makedepends=('git')
source=('git://git.drogon.net/wiringPi')
md5sums=('SKIP')

pkgver() {
	cd $_gitname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare() {
	cd $_gitname
	msg2 "Patching build file"
	export WIRINGPI_SUDO=''
	sed -i 's|$sudo make uninstall||g' build
	sed -i "s| make| make DESTDIR=\"${pkgdir}/usr\" PREFIX=\"\" LDCONFIG=\"\"|g" build
	msg2 "Patching Makefiles..."
	cd wiringPi
	sed -i "s|ln -sf \$(DESTDIR)\$(PREFIX)/lib/libwiringPi.so.\$(VERSION)	\$(DESTDIR)/lib/libwiringPi.so|ln -sf libwiringPi.so.\$(VERSION)	\$(DESTDIR)\$(PREFIX)/lib/libwiringPi.so|g" Makefile
	cd ../devLib
	sed -i "s|-I.|-I. -I${pkgdir}/usr/include|g" Makefile
	sed -i "s|ln -sf \$(DESTDIR)\$(PREFIX)/lib/libwiringPiDev.so.\$(VERSION)	\$(DESTDIR)/lib/libwiringPiDev.so|ln -sf libwiringPiDev.so.\$(VERSION)	\$(DESTDIR)\$(PREFIX)/lib/libwiringPiDev.so|g" Makefile
	cd ../gpio
	sed -i "s|/man/man1|/share/man/man1|g" Makefile
	#sed -i "s|-I\$(DESTDIR)\$(PREFIX)/include|-I${pkgdir}/usr/include|g" Makefile
	#sed -i "s|-L\$(DESTDIR)\$(PREFIX)/lib|-L${pkgdir}/usr/lib|g" Makefile
}
package() {
	msg2 "Creating skeleton dirs..."
	mkdir -p "${pkgdir}"/{usr/lib,usr/bin}
	cd $_gitname
	msg2 "Running wiringPi build/package script..."
	./build
}
