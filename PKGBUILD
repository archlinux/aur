# Maintainer: Silvio Knizek <killermoehre@gmx.net>
_pkgname=hdx-realtime-media-engine
pkgname="${_pkgname}-sap"
pkgver=2.2.100
_short_pkgver=221
_long_pkgver=2.2.100
_deb_rebuild=949
pkgrel=1
pkgdesc='Plug-In for Citrix Receiver to support clear, crisp high-definition audio-video calls, particularly with Microsoft Skype® for Business. This version is for access.sap.com compatibility.'
arch=('i686' 'x86_64')
_url='https://www.citrix.com/downloads/citrix-receiver/additional-client-software'
url="${_url}/${_pkgname}-${_short_pkgver}.html"
license=('custom')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('icaclient' 'pulseaudio' 'xorg-xvinfo')
if [[ "$CARCH" == 'x86_64' ]]; then
    depends+=('lib32-libxv' 'lib32-libpulse')
elif [[ "$CARCH" == 'i686' ]]; then
    depends+=('libxv' 'libpulse')
fi
makedepends=('binutils' 'tar' 'xz' 'awk')
install="${pkgname}.install"
source_i686=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux.zip::https:$(curl -L -silent "${_url}/${_pkgname}-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href=.*rel=.*Linux.zip/ { print $10 }')")
source_x86_64=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux_x64.zip::https:$(curl -L -silent "${_url}/${_pkgname}-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href=.*rel=.*Linux_x64.zip/ { print $10 }')")
sha256sums_i686=('ad0e1416ad89225a154b114e6d9bbf091c6e789034144c8f8ca31d58eeaf4908')
sha256sums_x86_64=('22638ae01f9d4bce999e8aeadd0e9eed8acfd4de8b79c6678d1b6e06bd269022')

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
    ar p "citrix-hdx-realtime-media-engine_${_long_pkgver}-${_deb_rebuild}_${my_deb_arch}.deb" data.tar.xz | tar xJ
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
