# Maintainer: Daniel Haß <aur@hass.onl>
# Co-Maintainer: Jai Brown (aur JaINTP) <dev [at] jaintp [dot] com>

_pkgname=capacities
_version=1.67.13
_image_url_x86_64="https://2vks4.upcloudobjects.com/capacities-desktop-app/Capacities-${_version}.AppImage"
_image_url_aarch64="https://2vks4.upcloudobjects.com/capacities-desktop-app/Capacities-${_version}-arm64.AppImage"

pkgname="${_pkgname}"-appimage
pkgver=1.67.13
pkgrel=1
pkgdesc="Personal Knowledge Management app - A studio for your mind"
arch=('x86_64' 'aarch64')
url="https://capacities.io/"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('capacities')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::${_image_url_x86_64}")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::${_image_url_aarch64}")
sha256sums_x86_64=('55ef7dad8892dff7459c857ca17c0472b63a1c67bc68adb0cb9b1ed1d9d2af6d')
sha256sums_aarch64=('2a3299020578dc59c53bd334104bc7f99b9c90fb76cb985f94dca6150b740b18')

_appimage="${_pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=(
    ${source_x86_64}
    ${source_aarch64}
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract io.capacities.app.desktop
    ./"${_appimage}" --appimage-extract usr/share/icons/hicolor/scalable/apps/capacities.svg
    ./"${_appimage}" --appimage-extract LICENSE.electron.txt
    ./"${_appimage}" --appimage-extract LICENSES.chromium.html
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=${_pkgname}|" \
        "squashfs-root/io.capacities.app.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${_pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/io.capacities.app.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/capacities.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}/"
    ln -s "/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}
