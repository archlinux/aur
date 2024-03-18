## Maintainer: Adi Prasetya <t.me/adiwastaken>

pkgname=mcpelauncher-appimage
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=0.14.1-790
pkgver="${_pkgver/-/.}"
pkgrel=2
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64")
url="https://github.com/minecraft-linux/appimage-builder"
license=('GPL3' 'MIT')
depends=(fuse2)
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher-ui-qt)
conflicts=(mcpelauncher-ui-qt)
options=(!strip)
_fileName="Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage"
_desktopFile="usr/share/applications/mcpelauncher-ui-qt.desktop"
_scalableIcon="usr/share/icons/hicolor/scalable/apps/mcpelauncher-ui-qt.svg"
source=("${url}/releases/download/v${_pkgver}/${_fileName}")
sha256sums=('22ec68127de07573829d8cc6a7049dad6cfcf2a6369a4ded2431c2c88e472a88')

prepare() {
    rm -rf "${srcdir}/squashfs-root"
    chmod +x ${srcdir}/${_fileName}
    ${srcdir}/${_fileName} --appimage-extract
    desktop-file-edit --set-key="Exec" --set-value="/usr/bin/mcpelauncher-ui-qt %U" "${srcdir}/squashfs-root/${_desktopFile}"
}

package() {
    # Install icon & desktop
    install -Dm644 "${srcdir}/squashfs-root/${_scalableIcon}" "${pkgdir}/${_scalableIcon}"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopFile}" "${pkgdir}/${_desktopFile}"
    # Install source
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp -r --target-directory="${pkgdir}/opt/${_pkgname}" "${srcdir}/squashfs-root/."
    ln -s "/opt/${_pkgname}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
