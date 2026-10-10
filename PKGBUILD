# Maintainer: Fangru Shao <matrixc7p@gmail.com>
pkgname=token-monitor-bin
_pkgname=token-monitor
pkgver=0.68.0
pkgrel=1
pkgdesc="Real-time token, cost, and AI limits widget with multi-device sync for Claude Code, Codex, OpenCode and more"
arch=('x86_64')
url="https://github.com/Javis603/token-monitor"
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("https://github.com/Javis603/token-monitor/releases/download/v${pkgver}/Token-Monitor-${pkgver}.AppImage")
noextract=("Token-Monitor-${pkgver}.AppImage")
sha256sums=('136ac6ac7c7c47e18f0fb02486326eb2290aea272c4d6202c901eb7c84fd3e48')

prepare() {
    chmod +x "Token-Monitor-${pkgver}.AppImage"
    rm -rf squashfs-root
    "./Token-Monitor-${pkgver}.AppImage" --appimage-extract >/dev/null
    sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" "squashfs-root/${_pkgname}.desktop"
}

package() {
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${_pkgname}/"

    # Clean up redundant AppImage-specific files inside /opt/token-monitor
    rm -rf "${pkgdir}/opt/${_pkgname}/usr/share/icons" \
           "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" \
           "${pkgdir}/opt/${_pkgname}/${_pkgname}.png" \
           "${pkgdir}/opt/${_pkgname}/.DirIcon"

    # Fix permissions
    find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    chmod 755 "${pkgdir}/opt/${_pkgname}/AppRun"
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

    # Launcher wrapper
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop entry and icon
    install -Dm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # Licenses
    install -Dm644 squashfs-root/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 squashfs-root/LICENSES.chromium.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
