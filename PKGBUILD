## Maintainer: Adi Prasetya <t.me/adiwastaken>

pkgname=mcpelauncher-appimage
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=0.15.2-796
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/minecraft-linux/appimage-builder"
license=('GPL3' 'MIT')
depends=()
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher-ui-qt)
conflicts=(mcpelauncher-ui-qt)
options=(!strip)
source_x86_64=("mcpelauncher-x86_64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage")
source_armv7h=("mcpelauncher-armv7h-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-armhf-v${pkgver}.AppImage")
source_aarch64=("mcpelauncher-aarch64-v${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-arm64-v${pkgver}.AppImage")
sha512sums_x86_64=('d2317bccef6fa72b3cbad30348456ecd51ba4b8450e98beda3bc086b0bb45f2d606b107a14efe73951b2f2f6b294b1e0cc0409143c6275c2e8c5d9cdcd9a200a')
sha512sums_armv7h=('d08067880f4ed17aa957fa8a1cf1d92000efe75dc82177659a0e7ba9f9f2f363f62632bbdcb1306e19e0edc45f676690b3181e982c6e797bc651201f3b3aee89')
sha512sums_aarch64=('a310658c3c62a774452548a5d17522c8f942f1b8c3ffeb315afcfbeacb120749392ee0528a7a7be05164eeea7f40a272631a1aea5a50c6ffcf3147b484e9272f')
_fileName="mcpelauncher-${CARCH}-v${pkgver}.AppImage"
_desktopFile="usr/share/applications/mcpelauncher-ui-qt.desktop"
_scalableIcon="usr/share/icons/hicolor/scalable/apps/mcpelauncher-ui-qt.svg"

prepare() {
    rm -rf "${srcdir}/squashfs-root"
    chmod +x "${srcdir}/${_fileName}"
    "${srcdir}/${_fileName}" --appimage-extract
    desktop-file-edit --set-key="Exec" --set-value="/usr/bin/mcpelauncher-ui-qt %U" "${srcdir}/squashfs-root/${_desktopFile}"
}

package() {
    # Install icon & desktop
    install -Dm644 "${srcdir}/squashfs-root/${_scalableIcon}" "${pkgdir}/${_scalableIcon}"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopFile}" "${pkgdir}/${_desktopFile}"
    # Install source
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
