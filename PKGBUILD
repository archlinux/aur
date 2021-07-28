# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: david0

pkgname=reaper-bin
pkgver=6.33
pkgrel=1
pkgdesc="A complete digital audio production application for computers, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://reaper.fm"
license=('custom')
depends=('gtk3' 'desktop-file-utils' 'xdg-utils' 'aribb24')
optdepends=('jack' 'pulseaudio')
provides=("reaper=${pkgver}")
source_x86_64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_x86_64.tar.xz")
source_i686=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_i686.tar.xz")
source_aarch64=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_aarch64.tar.xz")
source_armv7l=("https://reaper.fm/files/6.x/reaper${pkgver//.}_linux_armv7l.tar.xz")
sha256sums_x86_64=('7113779ed27bca2c6ce5b4ca63a12c48ed086588564f02b89c5fb63b5c327952')
sha256sums_i686=('78c1f133c9fd0c4f4830b40de2ecc4d931dd9d374f77dd2c2df9ecbd18c798d3')
sha256sums_aarch64=('5abc9aff63130a0f65c183e71033ef7a90bd55b4d63cd621df39d8cf3b496c69')
sha256sums_armv7l=('19e463a840bcfd756dc4656d52ff082fcd3468c9c68b2817d47a0930272f68d3')

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
