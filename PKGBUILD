# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-appimage
_pkgname=clawx
pkgver="0.3.9"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents AppImage"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("ClawX-${pkgver}-linux-x86_64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v${pkgver}/ClawX-${pkgver}-linux-x86_64.AppImage")
sha512sums_x86_64=('8ea1446a506f31ec1dbcc6bed4f183f9332ecd144d6864114ee3b5c6bf1c7d1c61fa86eada8852092b6dd2b8ef737b56b34967b04d22c9512fd29aaebb8376e8')
source_aarch64=("ClawX-${pkgver}-linux-arm64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v${pkgver}/ClawX-${pkgver}-linux-arm64.AppImage")
sha512sums_aarch64=('4c58a77cb0722e221c1c5c78e15a0fbbcea1c2b53e554c551e242791bda5f24e0caece433e6b2824bbd45695cc139e89261fb77b92f363b0c2e121818f8a72a8')
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
