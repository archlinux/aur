# Maintainer: Daniel Haß <aur@hass.onl>
# Maintainer: Jai Brown (JaINTP) <jaintp.dev@gmail.com>

_pkgname=capacities
_version=1.55.9
_image_url_x86_64="https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-${_version}.AppImage"
_image_url_aarch64="https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-${_version}-arm64.AppImage"

pkgname="${_pkgname}"-appimage
pkgver="${_version}"
pkgrel=2
pkgdesc="Personal Knowledge Management app - A studio for your mind"
arch=('x86_64' 'aarch64')
url="https://capacities.io/"
license=('custom')
options=(!strip !debug)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('capacities')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::${_image_url_x86_64}")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::${_image_url_aarch64}")
sha256sums_x86_64=('1d0b3ebb6a6293f1b8404c93e5a0726427471c5d23a7c2f32c42ec18ca4d2e8b')
sha256sums_aarch64=('3b6bf082114f332bc3d9ab9302f11d22f32d4e13e30fed0569a17cb66a988152')

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
