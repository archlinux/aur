# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-appimage
_pkgname=clawx
pkgver="0.4.8"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents AppImage"
arch=('x86_64' 'aarch64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("ClawX-0.4.8-linux-x86_64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.8/ClawX-0.4.8-linux-x86_64.AppImage")
sha512sums_x86_64=('569a87278d4f9a69a89169f1f8fda9e5c0475b30b6224709c5015a2b9d2886c9136e91c7c100817b55e7f4b1d86a80680b340a35a9bfac3fa660bd83b37f4846')
source_aarch64=("ClawX-0.4.8-linux-arm64.AppImage::https://github.com/ValueCell-ai/ClawX/releases/download/v0.4.8/ClawX-0.4.8-linux-arm64.AppImage")
sha512sums_aarch64=('60f35116ffba89a3e243db43be63078a2b075159db6c1d857e9433263a9d8b09ff93980009bef5b03ad196439463a3254c34ca997e977d6578cddbbe31e57937')
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
