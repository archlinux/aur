# Maintainer: SomeAspy <amb@aspy.dev>
pkgname=seafile-client-appimage
pkgver=9.0.15
pkgrel=1
pkgdesc="Seafile client AppImage"
arch=('x86_64')
url="https://www.seafile.com/"
license=('Apache-2.0')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=('!strip')

_appimage="Seafile-${CARCH}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://sos-ch-dk-2.exo.io/seafile-downloads/${_appimage}")
sha256sums_x86_64=('7b2501999c166322c9b55deebb5ad1a5ee8d383bdc636678347c14d56652f38a')

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
