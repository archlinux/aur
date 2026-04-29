# Maintainer: Daniel Haß <aur@hass.onl>
# Co-Maintainer: Jai Brown (aur JaINTP) <dev [at] jaintp [dot] com>

_pkgname=capacities
_version=1.63.3
_image_url_x86_64="https://2vks4.upcloudobjects.com/capacities-desktop-app/Capacities-${_version}.AppImage"
_image_url_aarch64="https://2vks4.upcloudobjects.com/capacities-desktop-app/Capacities-${_version}-arm64.AppImage"

pkgname="${_pkgname}"-appimage
pkgver=1.63.3
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
sha256sums_x86_64=('7298850bb286c18c9a6f9b3b254d76702277d766b37ab02a4fca5ae645a4f257')
sha256sums_aarch64=('2bd747430456e9d82956dc89a6d9a925e363306dcbf1e2c53c1ce3ac645265d6')

_appimage="${_pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=(
    ${source_x86_64}
    ${source_aarch64}
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract ${_pkgname}.desktop
    ./"${_appimage}" --appimage-extract ${_pkgname}.png
    real_icon_path=$(readlink "squashfs-root/${_pkgname}.png")
    if [[ -n "$real_icon_path" ]]; then
        ./"${_appimage}" --appimage-extract "$real_icon_path"
        mv "squashfs-root/$real_icon_path" "squashfs-root/${_pkgname}.png"
    fi
    ./"${_appimage}" --appimage-extract LICENSE.electron.txt
    ./"${_appimage}" --appimage-extract LICENSES.chromium.html
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_pkgname}.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${_pkgname}/LICENSE.electron.txt"
    install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" "${pkgdir}/opt/${_pkgname}/LICENSES.chromium.html"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}/"
    ln -s "/opt/${_pkgname}/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/opt/${_pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}