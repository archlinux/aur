# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=senden-bin
pkgver=0.1.128
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
sha256sums_x86_64=('ce4dd55a83460147ab4cbc01400d614672602a3425d33c9bf81a8785c935e9b5')
sha256sums_aarch64=('8a859df6436c441b934c7df724d4f29175b70c8bfce371d3ce51f30eacf02d51')

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
