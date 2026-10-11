# Maintainer: DenXV <aur@denxv.me>

_pkgname="hyprism"
_upstream_id="io.github.hyprismteam.Hyprism"
pkgname="${_pkgname}-bin"
pkgver="4.0.0"
pkgrel="1"
pkgdesc="A multiplatform Hytale launcher with mod manager and more! (binary version)"
arch=("x86_64")
url="https://github.com/hyprismteam/Hyprism"
license=("GPL-3.0-only")

depends=(
    "fontconfig"
    "glibc"
    "gcc-libs"
    "hicolor-icon-theme"
    "lttng-ust2.12"
)
optdepends=(
    "mesa: GPU acceleration"
    "noto-fonts-cjk: Chinese/Japanese/Korean support"
    "noto-fonts-emoji: Emoji support"
)
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
)
replaces=(
    "${_pkgname}"
    "${_pkgname}-git"
)
options=("!strip")

source=(
    "LICENSE::${url}/raw/refs/heads/main/LICENSE"
    "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/HyPrism-linux-x64-${pkgver}.deb"
    "${_pkgname}.desktop"
)
sha256sums=(
    "8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b"
    "5e9af70f27ee1b107fb1fcb83ff6f0cfc05fe46271113b6fcf52f0310793cb13"
    "89837ddd1c7dba01d6ac9e22b686fd7311986f2a49c1cd98c82fe72060dda679"
)

prepare() {
    # Create the source directory and extract the data archive from the .deb package into it
    install -d "${srcdir}/${_pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb" --include "data.tar.*" -O \
        | bsdtar -xf - -C "${srcdir}/${_pkgname}-${pkgver}"

    # Remove existing target directories/files to prevent mv conflicts
    rm -rf "${srcdir}/${_pkgname}-${pkgver}/opt/${pkgname}"

    # Rename the main application directory from 'hyprism' to 'hyprism-bin'
    mv -v "${srcdir}/${_pkgname}-${pkgver}/opt/${_pkgname}" "${srcdir}/${_pkgname}-${pkgver}/opt/${pkgname}"

    # Update binary symlink to point to the new location
    ln -sf "/opt/${pkgname}/Hyprism Launcher" "${srcdir}/${_pkgname}-${pkgver}/usr/bin/${_pkgname}"

    # Remove upstream desktop file (replaced by custom one)
    rm -fv "${srcdir}/${_pkgname}-${pkgver}/usr/share/applications/${_upstream_id}.desktop"

    # Rename icon to match package name
    _icon_dir="${srcdir}/${_pkgname}-${pkgver}/usr/share/icons/hicolor/scalable/apps"
    if [ -f "${_icon_dir}/${_upstream_id}.svg" ]; then
        mv -v "${_icon_dir}/${_upstream_id}.svg" "${_icon_dir}/${_pkgname}.svg"
    fi
}

package() {
    # Copy all prepared files from source directory to package directory preserving structure
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/." "${pkgdir}/"

    # Install the desktop entry file to the applications directory
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install the LICENSE file to the standard licenses directory for the package
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
