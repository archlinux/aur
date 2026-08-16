# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
pkgname="hyprism-bin"
pkgver="3.0.3"
pkgrel="3"
pkgdesc="A multiplatform Hytale launcher with mod manager and more! (binary version)"
arch=("x86_64")
url="https://github.com/HyPrismTeam/HyPrism"
license=("GPL-3.0-only")

depends=(
    "alsa-lib"
    "dbus"
    "gtk3"
    "lttng-ust2.12"
    "mesa"
    "nss"
)
provides=("hyprism")
conflicts=(
    "hyprism"
    "hyprism-git"
)
replaces=(
    "hyprism"
    "hyprism-git"
)
options=("!strip")

source=(
    "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/HyPrism-linux-amd64-${pkgver}.deb"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
    "LICENSE"
)
sha256sums=(
    "ca45a874dd4e0d3b399e9ea4d06823a7a58aa81b6da5512a30f1526b9323e484"
    "89837ddd1c7dba01d6ac9e22b686fd7311986f2a49c1cd98c82fe72060dda679"
    "5c5925eaf73aef13bb9a4eac3a47023ba36298ee4ed959056225df4539e566b1"
    "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986"
)

prepare() {
    # Create the source directory and extract the data archive from the .deb package into it
    install -d "${srcdir}/${_pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb" --include "data.tar.*" -O | \
        bsdtar -xf - -C "${srcdir}/${_pkgname}-${pkgver}"

    # Remove existing target directories/files to prevent mv conflicts
    rm -rf "${srcdir}/${_pkgname}-${pkgver}/opt/${pkgname}"
    rm -rf "${srcdir}/${_pkgname}-${pkgver}/usr/share/doc/${pkgname}"

    # Remove the original desktop file to avoid conflicts with the renamed version
    rm -rfv "${srcdir}/${_pkgname}-${pkgver}/usr/share/applications/HyPrism.desktop"

    # Rename the main application directory from 'HyPrism' to 'hyprism-bin'
    mv -v "${srcdir}/${_pkgname}-${pkgver}/opt/HyPrism" "${srcdir}/${_pkgname}-${pkgver}/opt/${pkgname}"

    # Rename documentation directory from 'io.github.hyprismteam.hyprism' to 'hyprism-bin'
    _doc="${srcdir}/${_pkgname}-${pkgver}/usr/share/doc/io.github.hyprismteam.hyprism"
    [ -d "${_doc}" ] && mv -v "${_doc}" "${_doc%/*}/${pkgname}"

    # Rename icon files from 'HyPrism.png' to 'hyprism.png' for all standard sizes
    for size in "16x16" "24x24" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512"; do
        _icon="${srcdir}/${_pkgname}-${pkgver}/usr/share/icons/hicolor/${size}/apps/HyPrism.png"
        [ -f "${_icon}" ] && mv -v "${_icon}" "${_icon%/*}/${_pkgname}.png"
    done

    # Replace the application ID in metainfo file and rename it to match the package name
    _metainfo="${srcdir}/${_pkgname}-${pkgver}/usr/share/metainfo/io.github.hyprismteam.HyPrism.metainfo.xml"
    if [ -f "${_metainfo}" ]; then
        sed -i "s|io.github.hyprismteam.HyPrism|${_pkgname}|g" "${_metainfo}"
        mv -v "${_metainfo}" "${_metainfo%/*}/${_pkgname}.metainfo.xml"
    fi
}

package() {
    # Copy all prepared files from source directory to package directory preserving structure
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/." "${pkgdir}/"

    # Install the launcher shell script to /usr/bin with executable permissions
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Install the desktop entry file to the applications directory
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install the LICENSE file to the standard licenses directory for the package
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
