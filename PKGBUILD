# Maintainer: Daniel Haß <aur@hass.onl>
# Co-Maintainer: Jai Brown (aur JaINTP) <dev [at] jaintp [dot] com>

_pkgname=capacities
_version=1.74.1
_image_url_x86_64="https://2vks4.upcloudobjects.com/capacities-desktop-app/Capacities-${_version}.AppImage"
_image_url_aarch64="https://2vks4.upcloudobjects.com/capacities-desktop-app/Capacities-${_version}-arm64.AppImage"

pkgname="${_pkgname}"-appimage
pkgver=1.74.1
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
sha256sums_x86_64=('82a3d29e488630aab40f111753fb8b5e13dda387718fd647664a97544c22b175')
sha256sums_aarch64=('18c8e27cfb78ab3cbfe1c5804a67c1e38b5b80ab419f708637ce5a1c2339d1ae')

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
