## Maintainer: Adi Prasetya <t.me/adiwastaken>

pkgname=mcpelauncher-appimage
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=0.14.1-790
pkgver="${_pkgver/-/.}"
pkgrel=3
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/minecraft-linux/appimage-builder"
license=('GPL3' 'MIT')
depends=(fuse2)
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher-ui-qt)
conflicts=(mcpelauncher-ui-qt)
options=(!strip)
source_x86_64=("mcpelauncher-x86_64-${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-x86_64-v${pkgver}.AppImage")
source_armv7h=("mcpelauncher-armv7h-${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-armhf-v${pkgver}.AppImage")
source_aarch64=("mcpelauncher-aarch64-${pkgver}.AppImage::$url/releases/download/v${_pkgver}/Minecraft_Bedrock_Launcher-arm64-v${pkgver}.AppImage")
sha512sums_x86_64=('94e78dcf29b093fd6feaf2eb67fb075cf60aa00c2e576c6646b0288a9701118d2f8703f1d265cc646c94ba0fa51a6b8f4b5a842889f71c6c0acd5be2349d044e')
sha512sums_armv7h=('2da44e76e6c748de42b64527636f4a42547cdac216e2780988b032155d6d0e64bc754b75555e1c1dd6ee710e3b241c0336ba1d9c15044d25273a2588638efac9')
sha512sums_aarch64=('a1c6580d625df21d7d16c381eb110d63108ad577c4f66d676ca7fddaa3cf496bede1a88e265642e3da9e12dab1e55f07030862f7f5786a858aaa983a445a6afd')
_fileName="mcpelauncher-${CARCH}-${pkgver}.AppImage"
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
    cp -r --target-directory="${pkgdir}/opt/${_pkgname}" "${srcdir}/squashfs-root/."
    ln -s "/opt/${_pkgname}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
