# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
# Maintainer: Ethan Best <ethan at totalsecond dot com>
# with special thanks to deadlte for version 3.07.1

pkgname=libsdrplay
pkgver=3.07.1
pkgrel=1
pkgdesc="Modules for the SDRplay receiver"
arch=('i686' 'x86_64')
url="http://www.sdrplay.com"
license=('custom:EULA')
depends=('libusb>=1.0')
source=("http://www.sdrplay.com/software/SDRplay_RSP_API-Linux-${pkgver}.run")
sha256sums=('aefe8733cba3e480157c28439c1ed5ab757724a7a26fe74eee92cda6f36145a8')

prepare() {
	cd ${srcdir}

	msg2 "Extracting makeself archive..."
	sh SDRplay_RSP_API-Linux-${pkgver}.run --tar xf
}

package() {
	cd "${srcdir}"
	
	msg2 "Getting API version..."
	_apivers=$(sed -n 's/^VERS="\(.*\)"/\1/p' install_lib.sh)
	msg2 "API version: ${_apivers}"

	# These commands are equivalent to the scripts used in the supplied
	# run file
	install -D -m644 sdrplay_license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 "${CARCH}/libsdrplay_api.so.${_apivers}" 		"${pkgdir}/usr/lib/libsdrplay_api.so.${_apivers}"
	install -D -m755 "${CARCH}/sdrplay_apiService" "${pkgdir}//usr/bin/sdrplay_apiService"
	install -D -m644 "scripts/sdrplay.service.usr" "${pkgdir}/etc/systemd/system/sdrplay.service"

	install -D -m644 inc/sdrplay_api.h "${pkgdir}/usr/include/sdrplay_api.h"
	install -D -m644 inc/sdrplay_api_callback.h "${pkgdir}/usr/include/sdrplay_api_callback.h"
	install -D -m644 inc/sdrplay_api_control.h "${pkgdir}/usr/include/sdrplay_api_control.h"
	install -D -m644 inc/sdrplay_api_dev.h "${pkgdir}/usr/include/sdrplay_api_dev.h"
	install -D -m644 inc/sdrplay_api_rsp1a.h "${pkgdir}/usr/include/sdrplay_api_rsp1a.h"
	install -D -m644 inc/sdrplay_api_rsp2.h "${pkgdir}/usr/include/sdrplay_api_rsp2.h"
	install -D -m644 inc/sdrplay_api_rspDuo.h "${pkgdir}/usr/include/sdrplay_api_rspDuo.h"
	install -D -m644 inc/sdrplay_api_rspDx.h "${pkgdir}/usr/include/sdrplay_api_rspDx.h"
	install -D -m644 inc/sdrplay_api_rx_channel.h "${pkgdir}/usr/include/sdrplay_api_rx_channel.h"
	install -D -m644 inc/sdrplay_api_tuner.h "${pkgdir}/usr/include/sdrplay_api_tuner.h"
		
	install -D -m644 66-mirics.rules "${pkgdir}/etc/udev/rules.d/66-mirics.rules"

	cd "${pkgdir}/usr/lib"
	ln -s libsdrplay_api.so.${_apivers} libsdrplay_api.so.2
	ln -s libsdrplay_api.so.${_apivers} libsdrplay_api.so
	
}
