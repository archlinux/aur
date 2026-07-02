# Maintainer: Xefreh
pkgname=zcode-appimage
pkgver=3.2.3
pkgrel=1
pkgdesc="ZCode desktop app packaged from the upstream AppImage"
arch=('x86_64' 'aarch64')
url="https://zcode.z.ai/en"
license=('custom:proprietary')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'xdg-utils' 'libdrm' 'mesa')
provides=('zcode')
conflicts=('zcode-bin' 'zcode-desktop-bin' 'z-code-bin')
options=('!strip' '!debug')

case "${CARCH}" in
    x86_64)  _arch='x64'   ;;
    aarch64) _arch='arm64' ;;
esac

_appimage="ZCode-${pkgver}-linux-${_arch}.AppImage"
_appdir="/opt/${pkgname}"
noextract=("${_appimage}")
source=("${_appimage}::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/${_appimage}")
sha256sums_x86_64=('3ea3891118dcf2f4383429d9f69e17cab168094ce865e42c3b116150600e8816')
sha256sums_aarch64=('6fb81fe0c8a00d34b6bdbc5fd94e7b5b9cad4cf21872b6852323d2341a1bbe9a')

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
