# Maintainer: Christoph Hartmann <mail_to_chriss@gmx.net>
pkgname=hdx-realtime-media-engine
pkgver=2.9.600
_short_pkgver=29600
_long_pkgver=2.9.600
_deb_rebuild=2900
pkgrel=1
pkgdesc='Plug-In for Citrix Receiver to support clear, crisp high-definition audio-video calls, particularly with Microsoft Skype® for Business.'
arch=('i686' 'x86_64')
_url='https://www.citrix.com/downloads/workspace-app/additional-client-software'
url="${_url}/${pkgname}-${_short_pkgver}.html"
license=('custom')
depends=('icaclient' 'libxv' 'libpulse' 'pulseaudio' 'libsndfile')
makedepends=('binutils' 'tar' 'xz' 'awk')
install="${pkgname}.install"
source_i686=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux.zip::https:$(curl -L -silent "${_url}/${pkgname}-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href=.*rel=.*Linux.zip/ { print $10 }')")
source_x86_64=("HDX_RealTime_Media_Engine_${pkgver}_for_Linux_x64.zip::https:$(curl -L -silent "${_url}/${pkgname}-${_short_pkgver}.html#ctx-dl-eula" | awk -F'"' '/href=.*rel=.*Linux_x64.zip/ { print $10 }')")
sha256sums_i686=('e3f0358ef672151beb95027f9b50776f55a2f2afbc2ff7a0dfcc42596f94b558')
sha256sums_x86_64=('c8e7b3af11f8d061439910c11de1fab5ec18599affa5f15c093cc822925f9e97')

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
