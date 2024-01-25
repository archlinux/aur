pkgname=wiringop-orangepi-5-plus-base-git
pkgver=2.52
pkgrel=2
pkgdesc='wiringPi for Orange Pi 5 Plus'
arch=('x86_64' 'aarch64')
url='https://github.com/orangepi-xunlong/wiringOP'
license=('LGPL-3.0')
makedepends=('git' 'make' 'gcc')
_commit="ce520ea17701445eb2e8e3cc1b6e157d29b63713"

source=(
	"git+https://github.com/orangepi-xunlong/wiringOP#commit=${_commit}"
	"01-Arch-Support.patch"
	"02-Change-Headers.patch"
)

md5sums=(
	SKIP 
	"9b18f834de9315011047171db92bd9bc"
	"6ac566d1f01ae1b032a0c91f2a451e4b"
)

build() {
	cd "${srcdir}/wiringOP"
	patch -p1 < "${srcdir}/01-Arch-Support.patch"
	patch -p1 < "${srcdir}/02-Change-Headers.patch"
	# wiringPi
	cd wiringPi
	make
	# devLib
	cd ../devLib
	make
}

package() {
	cd "${srcdir}/wiringOP"
	# wiringPi
	cd wiringPi
	install -m 0755 -d "${pkgdir}/usr/include"
	install -m 0644 *.h "${pkgdir}/usr/include"
	install -m 0755 -d "${pkgdir}/usr/lib"
	install -m 0755 libwiringPi.so.${pkgver} "${pkgdir}/usr/lib/libwiringPi.so.${pkgver}"
	ln -sf  "${pkgdir}/usr/lib/libwiringPi.so.${pkgver}"  "${pkgdir}/usr/lib/libwiringPi.so"
	
	# devLib
        cd ../devLib
	install -m 0755 -d "${pkgdir}/usr/include"
        install -m 0644 *.h "${pkgdir}/usr/include"
	install -m 0755 -d "${pkgdir}/usr/lib"
        install -m 0755 libwiringPiDev.so.${pkgver} "${pkgdir}/usr/lib/libwiringPiDev.so.${pkgver}"
        ln -sf  "${pkgdir}/usr/lib/libwiringPiDev.so.${pkgver}"  "${pkgdir}/usr/lib/libwiringPiDev.so"
}
