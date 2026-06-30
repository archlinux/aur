# Maintainer: full-bars <theinspiration17@proton.me>

pkgname=radar-omega
_pkgname=RadarOmega
pkgver=5.5.3
pkgrel=2
pkgdesc="Radar Omega - Advanced weather radar application (AppImage)"
arch=('x86_64')
url="https://radaromega.com"
license=('proprietary')
depends=('fuse2' 'hicolor-icon-theme')
options=(!strip !debug)
source=("${_pkgname}-${pkgver}-x86_64.AppImage::https://dl.todesktop.com/200402kk4yak2og/linux/appImage/x64")
sha256sums=('c8f3b2bbb56ed37d1c2fb815b4d851e0083e073d07f038942571a615f828b845')

prepare() {
    cd "${srcdir}"
    chmod +x "${_pkgname}-${pkgver}-x86_64.AppImage"
    ./"${_pkgname}-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    local appimage="${_pkgname}-${pkgver}-x86_64.AppImage"
    local appdir="/opt/${pkgname}"

    install -d "${pkgdir}${appdir}"
    install -Dm755 "${srcdir}/${appimage}" "${pkgdir}${appdir}/${pkgname}.AppImage"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<< "#!/bin/bash
exec ${appdir}/${pkgname}.AppImage \"\$@\""

    local sr="${srcdir}/squashfs-root"

    install -Dm644 "${sr}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    find "${sr}/usr/share/icons/hicolor" -type f \( -name "*.png" -o -name "*.svg" \) | while read -r icon; do
        local rel="${icon#*/hicolor/}"
        install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${rel}"
    done

    install -Dm644 "${sr}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s|^Exec=.*|Exec=${pkgname} %U|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s|^Icon=.*|Icon=${pkgname}|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    rm -rf "${sr}"
}
