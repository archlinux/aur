# Maintainer: Dan McCurry <dan.mc at protonmail dot com>

pkgname=libsdrplay
pkgver=2.11.1
pkgrel=1
pkgdesc="Modules for the SDRplay receiver"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('custom:EULA')
depends=('libusb>=1.0')
source=("http://www.sdrplay.com/software/SDRplay_RSP_API-Linux-${pkgver}.run")
md5sums=('d5d14dcb7d5212cf5a026e47c32a269b')

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
	install -D -m644 66-mirics.rules \
		"${pkgdir}/etc/udev/rules.d/66-mirics.rules"
	
	cd "${pkgdir}/usr/lib"
	ln -s libmirsdrapi-rsp.so.${_apivers} libmirsdrapi-rsp.so.2
	ln -s libmirsdrapi-rsp.so.${_apivers} libmirsdrapi-rsp.so
}
