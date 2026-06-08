# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-appimage
_pkgname=clawx
pkgver="0.4.9"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents AppImage"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("ClawX-0.4.9-linux-x86_64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.9/ClawX-0.4.9-linux-x86_64.AppImage")
sha512sums_x86_64=('2d3fde5e9a42d55acd8c640e4949b253a188e6eb388a8047e07fee37e0e2597256aa16bef22ead246681fc9ea26f4920813a80335edf331b9b1a9aeb186bd48a')
source_aarch64=("ClawX-0.4.9-linux-arm64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.9/ClawX-0.4.9-linux-arm64.AppImage")
sha512sums_aarch64=('754510327d8216041d5fc6a6d7f751ed0c53c0fef2fce4933afc76e31f9ebe248ff32ce59ed297f11c0061dd1ea67c0951a797cee2692b3b56904dea3eb5e481')
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
