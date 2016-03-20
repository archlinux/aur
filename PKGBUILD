# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
#######################################
#
# The API used to connect to the SDRPlay is proprietary.
# To obtain the API, you must register your SDRPlay at
# http://www.sdrplay.com/starthere.php. You must download
# the 'SDRplay_RSP_MiricsAPI-1.9.4.run' file but *do not*
# follow the remaining instructions (chmod 755, etc.)
# Instead copy the file to the same directory as the
# PKGBUILD and run makepkg.
#
# This PKGBUILD extracts the necessary files from the
# API binary so that they are installed in the correct
# locations expected in the soapysdrplay-git package and
# avoids installing the included outdated version of 
# SoapySDR.
#
#######################################
pkgname=libsdrplay
pkgver=1.9.4
pkgrel=1
pkgdesc="Modules for the SDRplay receiver"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('custom')
depends=('libusb>=1.0')
source=(file://SDRplay_RSP_MiricsAPI-1.9.4.run)
md5sums=('SKIP')

prepare() {
	mkdir $pkgname
# Strip the run file of superfluous scripts, untar, and extract license
	sed '1,498d' SDRplay_RSP_MiricsAPI-1.9.4.run > $pkgname/SDRplay_RSP_MiricsAPI-1.9.4.tar
	cd $pkgname
	tar -xf SDRplay_RSP_MiricsAPI-1.9.4.tar
	cat mirsdrapi-rsp.h | grep Copyright > LICENSE
}

package() {
	cd "$pkgname"
# These commands are equivalent to the scripts used in the supplied run file
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 libmirsdrapi-rsp-${CARCH}-1.8.1.so "${pkgdir}/usr/lib/libmirsdrapi-rsp-${CARCH}-1.8.1.so"
	install -D -m644 mirsdrapi-rsp.h "${pkgdir}/usr/include/mirsdrapi-rsp.h"
	install -D -m644 66-mirics.rules "${pkgdir}/etc/udev/rules.d/66-mirics.rules"
	cd "${pkgdir}/usr/lib"
	ln -s libmirsdrapi-rsp-${CARCH}-1.8.1.so libmirsdrapi-rsp-1.8.1.so
	ln -s libmirsdrapi-rsp-${CARCH}-1.8.1.so libmirsdrapi-rsp.so
}
