# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-appimage
_pkgname=clawx
pkgver="0.6.1"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents AppImage"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("ClawX-0.6.1-linux-x86_64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.1/ClawX-0.6.1-linux-x86_64.AppImage")
sha512sums_x86_64=('20ff69367c5021d5bdf2f43f4df9eb6da3feb926055577a2266c7cc48e8a771b7c67fa0233774a95f125161801ec06f5714b2d5cb9d906f6c24ca488d39cb799')
source_aarch64=("ClawX-0.6.1-linux-arm64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.1/ClawX-0.6.1-linux-arm64.AppImage")
sha512sums_aarch64=('f7c18e703a21eda2b0d9832fc13895163fef2ccd54f2da14ba03c063f1c1fb87b971b10be744402017652483fd9413454f4767fad2b6a7597814f52c76e073ac')
noextract=("ClawX-${pkgver}-linux-x86_64.AppImage" "ClawX-${pkgver}-linux-arm64.AppImage")

prepare() {
    local _appimage_arch

    case "${CARCH}" in
        x86_64) _appimage_arch='x86_64' ;;
        aarch64) _appimage_arch='arm64' ;;
        *) echo "Unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac

    chmod +x "${srcdir}/ClawX-${pkgver}-linux-${_appimage_arch}.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/ClawX-${pkgver}-linux-${_appimage_arch}.AppImage" --appimage-extract

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" "${srcdir}/squashfs-root/clawx.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/clawx.desktop"
}

package() {
    local _appimage_arch

    case "${CARCH}" in
        x86_64) _appimage_arch='x86_64' ;;
        aarch64) _appimage_arch='arm64' ;;
        *) echo "Unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac

    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    install -Dm755 "${srcdir}/ClawX-${pkgver}-linux-${_appimage_arch}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/clawx.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/clawx.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
