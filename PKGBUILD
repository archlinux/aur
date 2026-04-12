# Maintainer: SomeAspy <amb@aspy.dev>
pkgname=seafile-client-appimage
pkgver=9.0.18
pkgrel=1
pkgdesc="Seafile client AppImage"
arch=('x86_64')
url="https://www.seafile.com/"
license=('Apache-2.0')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=('!strip')

_appimage="Seafile-${CARCH}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://sos-ch-dk-2.exo.io/seafile-downloads/${_appimage}")
sha256sums_x86_64=('c520f2d6e8ce3b0661e9bc51dfc6d96abf1e8e3baeb01be692e3a66a2562e802')

conflicts=(
    "seafile-client"
    "seafile"
)

pkgver() {
    curl -s https://sos-ch-dk-2.exo.io/seafile-downloads/ | 
    grep -oP 'Seafile-x86_64-\K[\d.]+(?=\.AppImage)' | 
    sort -V | tail -1
}

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "squashfs-root/seafile.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "squashfs-root/seafile.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    local _desktop="${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i '/TryExec/d' "${_desktop}"
    sed -i "s|Exec=.*|Exec=/usr/bin/${pkgname} %u|" "${_desktop}"
    sed -i "s|Icon=.*|Icon=${pkgname}|" "${_desktop}"
}
