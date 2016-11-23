# Maintainer: Silvio Knizek <killermoehre@gmx.net>
pkgname=hdx-realtime-media-engine
pkgver=2.1.200
_short_pkgver=212
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
source_i686=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux.zip::https:$(curl -L -silent "https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href="#ctx-dl-eula".*rel=.*Linux.zip/ { print $10 }')")
source_x86_64=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux_x64.zip::https:$(curl -L -silent "https://www.citrix.com/downloads/citrix-receiver/additional-client-software/hdx-realtime-media-engine-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href="#ctx-dl-eula".*rel=.*Linux_x64.zip/ { print $10 }')")
sha256sums_i686=('6247857bf363484dcd2da077b4c511b86a950dff7822d26169cb55d2253fdf01')
sha256sums_x86_64=('7a80c581f8ee83410d3562d5ee87ea92669533a464197324822aad9fdb25afc8')

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
    ar p citrix-hdx-realtime-media-engine_${pkgver}-2_${my_deb_arch}.deb data.tar.xz | tar xJ
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
