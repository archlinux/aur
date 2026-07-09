# Maintainer: Xefreh
pkgname=zcode-appimage
pkgver=3.3.3
pkgrel=1
pkgdesc="ZCode desktop app packaged from the upstream AppImage"
arch=('x86_64' 'aarch64')
url="https://zcode.z.ai/en"
license=('custom:proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'xdg-utils' 'libdrm' 'mesa')
provides=('zcode')
conflicts=('zcode-bin' 'zcode-desktop-bin' 'z-code-bin')
options=('!strip' '!debug')

_appdir="/opt/${pkgname}"

_x64_appimage="ZCode-${pkgver}-linux-x64.AppImage"
_arm64_appimage="ZCode-${pkgver}-linux-arm64.AppImage"
noextract=("${_x64_appimage}" "${_arm64_appimage}")
source_x86_64=("${_x64_appimage}::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/${_x64_appimage}")
source_aarch64=("${_arm64_appimage}::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/${_arm64_appimage}")
sha256sums_x86_64=('c713ee023b5bcf69879c8baba794a51918b352abe13b2dcd110a95ccb070f675')
sha256sums_aarch64=('4298bbde74d7c114d9a7efb7dd349609f839e30fbbdae8bea15ba24d08571859')

prepare() {
    cd "${srcdir}"

    case "${CARCH}" in
        x86_64)  _appimage="${_x64_appimage}"   ;;
        aarch64) _appimage="${_arm64_appimage}" ;;
    esac

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
