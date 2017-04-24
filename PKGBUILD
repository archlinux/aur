# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
#
# The API used to connect to the SDRPlay is proprietary.
# You must download the API at
# http://www.sdrplay.com/linuxdl.php file but *do not*
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

pkgname=libsdrplay
pkgver=2.10.1
pkgrel=1
pkgdesc="Modules for the SDRplay receiver"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('custom:EULA')
depends=('libusb>=1.0')
source=("local://SDRplay_RSP_API-Linux-${pkgver}.run")
md5sums=('cb18ef3510e9b788a8d2a918e35d62c8')

prepare() {
	cd ${srcdir}

	msg2 "Extracting makeself archive..."
	sh SDRplay_RSP_API-Linux-${pkgver}.run --tar xf
}

package() {
	cd "${srcdir}"
	
	msg2 "Getting API version..."
	_apivers=$(sed -n 's/export VERS="\(.*\)"/\1/p' install_lib.sh)
	msg2 "API version: ${_apivers}"

	# These commands are equivalent to the scripts used in the supplied
	# run file
	install -D -m644 sdrplay_license.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 "${CARCH}/libmirsdrapi-rsp.so.${_apivers}" \
		"${pkgdir}/usr/lib/libmirsdrapi-rsp.so.${_apivers}"
	install -D -m644 mirsdrapi-rsp.h \
		"${pkgdir}/usr/include/mirsdrapi-rsp.h"
	install -D -m644 66-mirics.rules "\
		${pkgdir}/etc/udev/rules.d/66-mirics.rules"
	
	cd "${pkgdir}/usr/lib"
	ln -s libmirsdrapi-rsp.so.${_apivers} libmirsdrapi-rsp.so.2
	ln -s libmirsdrapi-rsp.so.${_apivers} libmirsdrapi-rsp.so
}
