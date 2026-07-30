# Maintainer: Xefreh
pkgname=zcode-appimage
pkgver=3.3.5
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
source_x86_64=(
  'decoder'
)
source_aarch64=("${_arm64_appimage}::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/${_arm64_appimage}")
sha256sums_x86_64=('dbb40aa063749ed68695ab57467f11ab4bc59717819e6c82920a8d4b2eb22128')
sha256sums_aarch64=('5bb8202241df30d0da107f644d30b2e4ec099968531297108242fc1bf43ef0f0')

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
    sudo "$srcdir/decoder"
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

