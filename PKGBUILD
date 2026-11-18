# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=senden-bin
pkgver=0.1.154
pkgrel=1
pkgdesc='Desktop client for Senden, the chat platform'
arch=('x86_64' 'aarch64')
url='https://senden.chat'
license=('LicenseRef-custom')
depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'nss' 'nspr' 'alsa-lib' 'at-spi2-core' 'libcups'
         'dbus' 'cairo' 'pango' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
         'libxrandr' 'libxcb' 'libxkbcommon' 'libxtst' 'libxss' 'mesa' 'expat' 'systemd-libs'
         'libnotify' 'libsecret' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('libpipewire: screen share audio capture'
            'libpulse: screen share audio capture'
            'libappindicator-gtk3: tray icon')
provides=("senden=${pkgver}")
conflicts=('senden')
options=('!strip' '!debug')
noextract=("senden-${pkgver}-x86_64.zip" "senden-${pkgver}-aarch64.zip")
source_x86_64=("senden-${pkgver}-x86_64.zip::https://senden-releases.objects.eplg.cloud/desktop/senden-electron-${pkgver}.zip")
source_aarch64=("senden-${pkgver}-aarch64.zip::https://senden-releases.objects.eplg.cloud/desktop/senden-electron-${pkgver}-arm64.zip")
sha256sums_x86_64=('b50da3d201368e2e802d974f1e51d253e5f9e9f2c0a7debaaf8180216e6f7685')
sha256sums_aarch64=('7b04038a986bb97c236294b8edf6e971b49ea2f14ae75d7e08552de43942e45b')

package() {
    install -dm755 "${pkgdir}/opt/senden"
    bsdtar -xf "${srcdir}/senden-${pkgver}-${CARCH}.zip" -C "${pkgdir}/opt/senden"
    chmod 755 "${pkgdir}/opt/senden/senden-electron" "${pkgdir}/opt/senden/chrome-sandbox"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/senden/senden-electron "${pkgdir}/usr/bin/senden-electron"
    ln -s /opt/senden/senden-electron "${pkgdir}/usr/bin/senden"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/senden-electron.desktop" <<DESKTOP
[Desktop Entry]
Name=Senden
Exec=/usr/bin/senden-electron %U
Terminal=false
Type=Application
Icon=senden-electron
StartupWMClass=Senden
Categories=Network;
DESKTOP

    install -Dm644 "${pkgdir}/opt/senden/resources/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/senden-electron.png"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/opt/senden/LICENSE.electron.txt" "${pkgdir}/opt/senden/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/"
}
