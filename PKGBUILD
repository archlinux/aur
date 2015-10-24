# Maintainer: lks <lukas <.> graetz <@> web <.> de>
# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname="t2n"
pkgver=0.5
pkgrel=3
pkgdesc="A Tool for communication between PC and Lego NXT over usb"
arch=('i686' )
url="http://www-verimag.imag.fr/~raymond/edu/lego/t2n/"
license=('LGPL')
makedepends=("automake" "autoconf")
depends=("libusb-compat" "lego-udev-rules")
source=("http://www-verimag.imag.fr/~raymond/edu/lego/t2n/${pkgname}-${pkgver}.src.tgz" \
	"Makefile.am"
	"configure.ac")

md5sums=('378020803c8657a2ee03570fad2ee804'
	'c10f2eb53db8d5304138bae316c3194b'
	'3158f44e4feb65ad916ddb81427fece8')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}.src

	cp ../../Makefile.am src/Makefile.am
	cp ../../configure.ac src/configure.ac
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}.src/src
	aclocal
	autoconf
	automake --add-missing
	./configure LDFLAGS="${LDFLAGS} -lusb" CFLAGS="${CFLAGS} -lusb" CXXFLAGS="${CXXFLAGS} -lusb"
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}.src

	# install the binaries
	install -D -m755 src/t2n ${pkgdir}/usr/bin/t2n || return 1
	install -D -m755 src/usbscan ${pkgdir}/usr/bin/usbscan || return 1
	
	# install udev rule
	#install -D -m644 udev/70-lego.rules ${pkgdir}/etc/udev/rules.d/70-lego.rules
}

