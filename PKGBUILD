# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: david0

pkgname=reaper-bin
pkgver=6.45
pkgrel=1
pkgdesc="A complete digital audio production application for computers, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://reaper.fm"
license=('custom')
depends=('gtk3' 'desktop-file-utils' 'xdg-utils' 'aribb24')
optdepends=('jack' 'pulseaudio')
provides=("reaper=${pkgver}" 'lv2-host' 'vst-host' 'vst3-host')
source_x86_64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_x86_64.tar.xz")
source_i686=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_i686.tar.xz")
source_aarch64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_aarch64.tar.xz")
source_armv7l=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_armv7l.tar.xz")
sha256sums_x86_64=('51348f0a79b33bc81adb53c94c6e00ad50597c63480b2209c5a6bc56a09ed2de')
sha256sums_i686=('4e0440382ae6ef5de4252a77360ef5549f1d000c908ec065795af7eae9deb767')
sha256sums_aarch64=('cd45303c5d7092ee88e593df3565ec9a7ffe3cf0c94b522188bc49a3528204e6')
sha256sums_armv7l=('c4ef4ce77c4313813e8df994327f0414d47af3b918e1529ad1213975d6fdebff')

_arch=$(uname -m)

package() {
    XDG_DATA_HOME="${srcdir}/desktop" sh "${srcdir}/reaper_linux_${_arch}/install-reaper.sh" --install "${pkgdir}/opt" --integrate-user-desktop

    rm "${pkgdir}/opt/REAPER/uninstall-reaper.sh"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/REAPER/reaper "${pkgdir}/usr/bin/reaper"

    mkdir -p "${pkgdir}/usr/share/licenses/reaper"
    ln -s /opt/REAPER/EULA.txt "${pkgdir}/usr/share/licenses/reaper/LICENSE"

    sed -i 's#^Exec.*#Exec="/opt/REAPER/reaper" %F#g' "${srcdir}/desktop/applications/cockos-reaper.desktop"

    install -Dm644 "${srcdir}/desktop/applications/cockos-reaper.desktop" "${pkgdir}/usr/share/applications/cockos-reaper.desktop"

    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "${srcdir}/desktop/icons/hicolor/256x256/apps/"*.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "${srcdir}/desktop/mime/packages/application-x-reaper.xml" "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"
}
