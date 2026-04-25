# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
pkgname="hyprism-bin"
pkgver="3.0.2"
pkgrel="1"
pkgdesc="A multiplatform Hytale launcher with mod manager and more! (binary version)"
arch=("x86_64")
url="https://github.com/HyPrismTeam/HyPrism"
license=("GPL-3.0-only")

provides=("hyprism")
conflicts=(
    "hyprism"
    "hyprism-git"
)
depends=(
    "alsa-lib"
    "dbus"
    "gtk3"
    "lttng-ust2.12"
    "mesa"
    "nss"
)
options=("!strip")

source=(
    "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/HyPrism-linux-amd64-${pkgver}.deb"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
    "LICENSE"
)
sha256sums=(
    "59c637a64d0c7161141559353ac5af23c3fcfabe47405f60cc58b45377274d0a"
    "89837ddd1c7dba01d6ac9e22b686fd7311986f2a49c1cd98c82fe72060dda679"
    "da29f0d435a6f790eba5a635ace043404eff44cb726a627673d5d3830d4a615d"
    "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986"
)

prepare() {
    # Create the source directory and extract the data archive from the .deb package into it
    install -d "${srcdir}/${_pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb" --include "data.tar.*" -O | \
        bsdtar -xf - -C "${srcdir}/${_pkgname}-${pkgver}"
}

package() {
    # Install main application files to /opt
    install -d "${pkgdir}/opt/${pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/opt/HyPrism/." "${pkgdir}/opt/${pkgname}/"

    # Install hicolor icons with lowercase filename
    for size in "16x16" "24x24" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512"; do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/usr/share/icons/hicolor/${size}/apps/HyPrism.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done

    # Install launcher script, desktop entry, and license file
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
