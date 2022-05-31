# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: david0

pkgname=reaper-bin
pkgver=6.59
pkgrel=1
pkgdesc="A complete digital audio production application for computers, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://reaper.fm"
license=('custom')
depends=('gtk3' 'desktop-file-utils' 'xdg-utils' 'aribb24')
optdepends=('jack'
            'pulseaudio')
provides=("reaper=${pkgver}" 'lv2-host' 'vst-host' 'vst3-host')
source_x86_64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_x86_64.tar.xz")
source_i686=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_i686.tar.xz")
source_aarch64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_aarch64.tar.xz")
source_armv7l=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_armv7l.tar.xz")
sha256sums_x86_64=('b6aa10037cd2b3d7b7d0567319321c8569a7037b58b5977679a6a98a533665fe')
sha256sums_i686=('e09679824dd1cb696c5bff853a88506f6d20320dc585f58c2a31d55b65535220')
sha256sums_aarch64=('3477ce64ceed89d6e7527f69913f9214a1de9bebfdfa241843542dc84166175c')
sha256sums_armv7l=('eec03df4250b8d1234dd38e70e141f601ea71b834c0233a717d118c401844281')

_arch=$(uname -m)

package() {
    XDG_DATA_HOME="${srcdir}/desktop" sh "${srcdir}/reaper_linux_${_arch}/install-reaper.sh" --install "${pkgdir}/opt" --integrate-user-desktop

    rm "${pkgdir}/opt/REAPER/uninstall-reaper.sh"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/REAPER/reaper "${pkgdir}/usr/bin/reaper"

    mkdir -p "${pkgdir}/usr/share/licenses/reaper"
    ln -s /opt/REAPER/EULA.txt "${pkgdir}/usr/share/licenses/reaper/LICENSE"

    sed -i 's|^Exec.*|Exec="/opt/REAPER/reaper" %F|g' "${srcdir}/desktop/applications/cockos-reaper.desktop"

    install -Dm644 "${srcdir}/desktop/applications/cockos-reaper.desktop" "${pkgdir}/usr/share/applications/cockos-reaper.desktop"

    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "${srcdir}/desktop/icons/hicolor/256x256/apps/"*.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "${srcdir}/desktop/mime/packages/application-x-reaper.xml" "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"
}
