# Maintainer: Silvio Knizek <killermoehre@gmx.net>
pkgname=hdx-realtime-media-engine
pkgver=2.0.100
pkgrel=1
pkgdesc='Plug-In for Citrix Receiver to support clear, crisp high-definition audio-video calls, particularly with Microsoft Skype® for Business.'
arch=('i686' 'x86_64')
url='https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-201.html'
license=('custom')
depends=('icaclient')
if [[ "$CARCH" == 'x86_64' ]]; then
	depends+=('lib32-libxv' 'lib32-libpulse')
elif [[ "$CARCH" == 'i686' ]]; then
	depends+=('libxv' 'libpulse')
fi
makedepends=('binutils' 'tar' 'gzip' 'awk')
install="${pkgname}.install"
source=("HDX_RealTime_Media_Engine_2.0.100_for_Linux.zip::https:$(curl -L -silent 'https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-201.html#ctx-dl-eula' | awk -F'"' '/href="#ctx-dl-eula".*rel=.*Linux/ { print $10 }')")
sha256sums=('e6edb8bcc6789987e1c06959a7e40dced4d936bc4b8f62671b6ed43eddc9fb2e')

package() {
	ICAROOT='/opt/Citrix/ICAClient'
	cd "${srcdir}/HDX_RealTime_Media_Engine_2.0.100_for_Linux/i386"
	ar p citrix-hdx-realtime-media-engine_2.0.100-6_i386.deb data.tar.gz | tar xz
	install -d -m 0755 -g root -o root "${pkgdir}/usr/lib/udev/rules.d/"
	install -d -m 0777 -g root -o root "${pkgdir}/var/lib/RTMediaEngineSRV"
	install -d -m 0777 -g root -o root "${pkgdir}/var/log/RTMediaEngineSRV"
	install -d -m 0755 -g root -o root "${pkgdir}${ICAROOT}/rtme"
	install -m 0444 -g root -o root "${srcdir}/HDX_RealTime_Media_Engine_2.0.100_for_Linux/i386/usr/local/bin/50-hid.rules" "${pkgdir}/usr/lib/udev/rules.d/"
	install -m 0755 -g root -o root "${srcdir}/HDX_RealTime_Media_Engine_2.0.100_for_Linux/i386/usr/local/bin/HDXRTME.so" "${pkgdir}${ICAROOT}"
	for file in RTMediaEngineSRV RTMEconfig; do
		install -m 0755 -g root -o root "${srcdir}/HDX_RealTime_Media_Engine_2.0.100_for_Linux/i386/usr/local/bin/$file" "${pkgdir}${ICAROOT}/rtme/"
	done
	for file in EULA.rtf InboundCallRing.wav DialTone_US.wav; do
		install -m 0644 -g root -o root "${srcdir}/HDX_RealTime_Media_Engine_2.0.100_for_Linux/i386/usr/local/bin/$file" "${pkgdir}${ICAROOT}/rtme/"
	done
}
