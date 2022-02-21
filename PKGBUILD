# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: david0

pkgname=reaper-bin
pkgver=6.49
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
sha256sums_x86_64=('824e4f70013534a326ec984333153ab7d970d3b02eb2f8d32a7500fc66c40774')
sha256sums_i686=('b27ed6a919c043070fadda709d4d3d16aa0ca1cbe53b5f832484208686991819')
sha256sums_aarch64=('6276fd814382c47047f0ffe0705f82d13a6ccfcd7736d20470e38c363a0d6f55')
sha256sums_armv7l=('8fa65fc2dca45280196d7cfe3852113897db13bf1550e4f1d62978c60a6d7b59')

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
