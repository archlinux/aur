# Maintainer: Silvio Knizek <killermoehre@gmx.net>
pkgname=hdx-realtime-media-engine
pkgver=2.1
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
makedepends=('binutils' 'tar' 'xz' 'awk')
install="${pkgname}.install"
source_i686=("HDX_RealTime_Media_Engine_2.1_for_Linux.zip::https:$(curl -L -silent 'https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-21.html#ctx-dl-eula' | awk -F'"' '/href="#ctx-dl-eula".*rel=.*Linux.zip/ { print $10 }')")
source_x86_64=("HDX_RealTime_Media_Engine_2.1_for_Linux_x64.zip::https:$(curl -L -silent 'https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-21.html#ctx-dl-eula' | awk -F'"' '/href="#ctx-dl-eula".*rel=.*Linux_x64.zip/ { print $10 }')")
md5sums_i686=('99c03fa653d30870f05eb9fbc4b203c6')
md5sums_x86_64=('3d408971ecad34efbe8f07c46fe7cbd9')
sha256sums_i686=('3c5948391b8dd2fa537f8cb563d5e02ffcdcfa6d2f31e43c0e67f191113042d4')
sha256sums_x86_64=('858b6c51f2657903e54a9a101469a6add8329dc5b488ce9ed03a1d8652af4610')

package() {
	ICAROOT='/opt/Citrix/ICAClient'
    if [[ "$CARCH" == 'i686' ]]; then
        CARCH='i386'
        my_deb_arch="$CARCH"
        my_dir_name="HDX_RealTime_Media_Engine_${pkgver}_for_Linux"
    fi
    if [[ "$CARCH" == 'x86_64' ]]; then
        my_deb_arch='amd64'
        my_dir_name="HDX_RealTime_Media_Engine_${pkgver}_for_Linux_x64"
    fi
	cd "${srcdir}/${my_dir_name}/${CARCH}"
	ar p citrix-hdx-realtime-media-engine_${pkgver}.0-602_${my_deb_arch}.deb data.tar.xz | tar xJ
	install -d -m 0755 -g root -o root "${pkgdir}/usr/lib/udev/rules.d/"
	install -d -m 0777 -g root -o root "${pkgdir}/var/lib/RTMediaEngineSRV"
	install -d -m 0777 -g root -o root "${pkgdir}/var/log/RTMediaEngineSRV"
	install -d -m 0755 -g root -o root "${pkgdir}${ICAROOT}/rtme"
	install -m 0444 -g root -o root "${srcdir}/${my_dir_name}/${CARCH}/usr/local/bin/50-hid.rules" "${pkgdir}/usr/lib/udev/rules.d/"
	install -m 0755 -g root -o root "${srcdir}/${my_dir_name}/${CARCH}/usr/local/bin/HDXRTME.so" "${pkgdir}${ICAROOT}"
	for file in RTMediaEngineSRV RTMEconfig; do
		install -m 0755 -g root -o root "${srcdir}/${my_dir_name}/${CARCH}/usr/local/bin/$file" "${pkgdir}${ICAROOT}/rtme/"
	done
	for file in EULA.rtf InboundCallRing.wav DialTone_US.wav; do
		install -m 0644 -g root -o root "${srcdir}/${my_dir_name}/${CARCH}/usr/local/bin/$file" "${pkgdir}${ICAROOT}/rtme/"
	done
}
