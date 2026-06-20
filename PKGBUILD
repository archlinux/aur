# Maintainer: Nzo <0x6e7a6f at proton dot me>

pkgname=suprow
pkgver=0.9.9.0.beta
_pkgver=0.9.9.0-beta
pkgrel=1
pkgdesc="Privacy-first desktop browser with built-in ad blocking"
arch=('x86_64')
url="https://suprow.app"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'hicolor-icon-theme' 'libseccomp' 'mesa' 'nss' 'xdg-utils')
optdepends=('libnotify: desktop notifications'
            'pipewire: WebRTC and screen sharing under Wayland'
            'xdg-desktop-portal: desktop integration under Wayland')
options=('!strip' '!debug')
source=("suprow-${_pkgver}.zip::https://suprow.app/downloads/releases/lnx/suprow-linux-x64-${_pkgver}.zip"
        "suprow.desktop"
        "suprow.svg")
sha256sums=('6e348a366f8a8eee660cb312e29da89f397e94501ab51fb21bde1f0ff36b29a4'
            '933bb4042c8d2eca8a9bb81a5694ddec5275a326016ec0ca092a59adb9960d71'
            'fa94715957cf541271d4d05ba86f385bbf0ed42bcfb1387dc6c527fdd05305c0')

package() {
    # The archive extracts to: suprow-linux-x64/
    local _srcdir="${srcdir}/suprow-linux-x64"

    # Install application files to /opt/suprow
    install -dm755 "${pkgdir}/opt/suprow"
    cp -a "${_srcdir}/"* "${pkgdir}/opt/suprow/"

    # Ensure correct permissions for binaries (zip may not preserve them)
    chmod 755 "${pkgdir}/opt/suprow/suprow"
    chmod 755 "${pkgdir}/opt/suprow/chrome_crashpad_handler"

    # chrome-sandbox requires SUID root to enable the Electron sandbox
    chown root:root "${pkgdir}/opt/suprow/chrome-sandbox"
    chmod 4755 "${pkgdir}/opt/suprow/chrome-sandbox"

    # Create symlink in /usr/bin so the binary is available in PATH
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/suprow/suprow "${pkgdir}/usr/bin/suprow"

    # Install .desktop entry
    install -Dm644 "${srcdir}/suprow.desktop" "${pkgdir}/usr/share/applications/suprow.desktop"

    # Install scalable icon
    install -Dm644 "${srcdir}/suprow.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/suprow.svg"

    # Install license file
    install -Dm644 "${srcdir}/suprow-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
