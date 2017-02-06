# Maintainer: Silvio Knizek <killermoehre@gmx.net>
pkgname=hdx-realtime-media-engine
pkgver=2.2
_short_pkgver=22
_long_pkgver=2.2.0
_deb_rebuild=837
pkgrel=1
pkgdesc='Plug-In for Citrix Receiver to support clear, crisp high-definition audio-video calls, particularly with Microsoft Skype® for Business.'
arch=('i686' 'x86_64')
url='https://www.citrix.com/downloads/citrix-receiver/additional-client-software/'
license=('custom')
depends=('icaclient')
if [[ "$CARCH" == 'x86_64' ]]; then
    depends+=('lib32-libxv' 'lib32-libpulse')
elif [[ "$CARCH" == 'i686' ]]; then
    depends+=('libxv' 'libpulse')
fi
makedepends=('binutils' 'tar' 'xz' 'awk')
install="${pkgname}.install"
source_i686=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux.zip::https:$(curl -L -silent "https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href=.*rel=.*Linux.zip/ { print $10 }')")
source_x86_64=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux_x64.zip::https:$(curl -L -silent "https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href=.*rel=.*Linux_x64.zip/ { print $10 }')")
sha256sums_i686=('66c8416c9483a5a38f4e84620ad3d35e0893a4943c54ee70afa7d885e6b24c0e')
sha256sums_x86_64=('a038d79561d5873a3af63df13cb1557a62c3a59a9adab937714460fe67970705')

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
    ar p citrix-hdx-realtime-media-engine_${_long_pkgver}-${_deb_rebuild}_${my_deb_arch}.deb data.tar.xz | tar xJ
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
