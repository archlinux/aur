# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-appimage
_pkgname=clawx
pkgver="0.6.2"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents AppImage"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("ClawX-0.6.2-linux-x86_64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.2/ClawX-0.6.2-linux-x86_64.AppImage")
sha512sums_x86_64=('b40f73fd55901248e3db58d17c5b89b3957ea75c79c5bdc277dfcd0e1b6b7c57c6385610094e659d5b70e1603aa0c18deaa9958e48dcdc41cb2fe5b2fa5adb4c')
source_aarch64=("ClawX-0.6.2-linux-arm64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.6.2/ClawX-0.6.2-linux-arm64.AppImage")
sha512sums_aarch64=('bee96c7160b68f4ed7f7e1def4dabb7cc496f57fdbe1f07fd24046c88870ab87bd92908cecefb50accae7dd1a856157f1dfaa4d4c173016c821ec1c489ff96ec')
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
