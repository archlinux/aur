# Maintainer: Wanxp <977741432@qq.com>
pkgname=plane-desktop-bin
_pkgname=plane-desktop
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop client for Plane project management"
arch=('x86_64')
url="https://plane.so/download"
license=('AGPL-3.0-only')
depends=(
    'fuse2'
    'hicolor-icon-theme'
    'xdg-utils'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')
_build=260325tah3zsnil
_appimage="Plane-${pkgver}-${_build}-x86_64.AppImage"
source=(
    "${_appimage}::https://dl.todesktop.com/260130r75i625/builds/${_build}/linux/appImage/x64"
)
sha256sums=(
    '69db8bca5d95ace38a0e78e956aa3c459b59abcd27f4c5728307dc3933cbf76c'
)

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract >/dev/null

    sed -e "s|^Exec=.*|Exec=/usr/bin/${_pkgname} --no-sandbox %U|" \
        -e "s|^Icon=.*|Icon=${_pkgname}|" \
        -i "${srcdir}/squashfs-root/desktop.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/Plane.AppImage"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Plane.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    local icon size
    while IFS= read -r -d '' icon; do
        size="$(basename "$(dirname "$(dirname "${icon}")")")"
        install -Dm644 "${icon}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done < <(find "${srcdir}/squashfs-root/usr/share/icons/hicolor" -type f -name 'desktop.png' -print0)

    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
