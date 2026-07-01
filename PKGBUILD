# Maintainer: Xefreh
pkgname=zcode-appimage
pkgver=3.2.2
pkgrel=1
pkgdesc="ZCode desktop app packaged from the upstream AppImage"
arch=('x86_64')
url="https://zcode.z.ai/en"
license=('custom:proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'xdg-utils' 'libdrm' 'mesa')
provides=('zcode')
conflicts=('zcode-bin' 'zcode-desktop-bin' 'z-code-bin')
options=('!strip' '!debug')
_appimage="ZCode-${pkgver}-linux-x64.AppImage"
_appdir="/opt/${pkgname}"
noextract=("${_appimage}")
source=("${_appimage}::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/${_appimage}")
sha256sums=('40bf72d8a086b4dddf1d9d0866001a6a0f547f84475c4d05ac58be3a177c0b3d')

prepare() {
    cd "${srcdir}"

    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
    sed -i "s|^Exec=AppRun|Exec=${_appdir}/AppRun|" squashfs-root/zcode.desktop
}

package() {
    cd "${srcdir}/squashfs-root"

    install -dm755 "${pkgdir}${_appdir}" "${pkgdir}/usr/bin"
    cp -a . "${pkgdir}${_appdir}/"

    find "${pkgdir}${_appdir}" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}${_appdir}"/{AppRun,zcode,chrome_crashpad_handler,chrome-sandbox}

    ln -s "${_appdir}/AppRun" "${pkgdir}/usr/bin/zcode"
    install -Dm644 zcode.desktop "${pkgdir}/usr/share/applications/zcode.desktop"

    find usr/share/icons -type f | while read -r _icon; do
        install -Dm644 "${_icon}" "${pkgdir}/${_icon}"
    done
}
