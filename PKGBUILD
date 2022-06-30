# Maintainer: Francesc Ortiz <francescortiz at gmail dot com>
# Contributor: Nocifer
# Contributor: david0

pkgname=reaper-bin
pkgver=6.61
pkgrel=1
pkgdesc="A complete digital audio production application for computers, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://reaper.fm"
license=('custom')
depends=('gtk3' 'desktop-file-utils' 'xdg-utils' 'aribb24')
optdepends=('jack'
            'pulseaudio'
            'alsa-lib')
provides=("reaper=${pkgver}" 'lv2-host' 'vst-host' 'vst3-host')
source_x86_64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_x86_64.tar.xz")
source_i686=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_i686.tar.xz")
source_aarch64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_aarch64.tar.xz")
source_armv7l=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_armv7l.tar.xz")
sha256sums_x86_64=('2e9d84564cb5fabb9cf3a2dd326be16488aca189743b176456737787fbb4f484')
sha256sums_i686=('c1d0cca4a8ede79f5a99789c515b9daa94f101fdb6d66e450545c95030445ec4')
sha256sums_aarch64=('b0f2c2300fffc407565e363bfbe47a78b592e7a662d2efbd8eeec9948086bd57')
sha256sums_armv7l=('6d374889054b10644567ce098ef100196935678889eb2dcd8f3dbf92ee1f2a32')

_arch=$(uname -m)

package() {
    XDG_DATA_HOME="${srcdir}/desktop" sh "${srcdir}/reaper_linux_${_arch}/install-reaper.sh" --install "${pkgdir}/opt" --integrate-user-desktop

    rm "${pkgdir}/opt/REAPER/uninstall-reaper.sh"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/REAPER/reaper "${pkgdir}/usr/bin/reaper"

    mkdir -p "${pkgdir}/usr/share/licenses/reaper-bin"
    ln -s /opt/REAPER/EULA.txt "${pkgdir}/usr/share/licenses/reaper-bin/LICENSE"

    sed -i 's|^Exec.*|Exec="/opt/REAPER/reaper" %F|g' "${srcdir}/desktop/applications/cockos-reaper.desktop"

    install -Dm644 "${srcdir}/desktop/applications/cockos-reaper.desktop" "${pkgdir}/usr/share/applications/cockos-reaper.desktop"

    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "${srcdir}/desktop/icons/hicolor/256x256/apps/"*.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    install -Dm644 "${srcdir}/desktop/mime/packages/application-x-reaper.xml" "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"
}
