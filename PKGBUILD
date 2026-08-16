# Maintainer: DenXV <aur@denxv.me>

_pkgname="f2p-evo"
pkgname="f2p-evo-bin"
pkgver="0.3.40"
pkgrel="2"
pkgdesc="F2P Evo - unofficial Hytale launcher (Rust + Tauri 2 + Vue 3) with multiplayer, mods, chat, and auto-updates (binary version)"
arch=("x86_64")
url="https://git.sanhost.net/sanasol/f2p-evo"
license=("custom")

depends=(
    "hicolor-icon-theme"
    "gtk3"
    "libappindicator"
    "webkit2gtk-4.1"
)
optdepends=(
    "noto-fonts-cjk: Chinese/Japanese/Korean support"
    "noto-fonts-emoji: Emoji support"
)
provides=("f2p-evo")
conflicts=(
    "f2p-evo"
    "f2p-evo-git"
    "hytale-f2p-git"
)
replaces=(
    "f2p-evo"
    "f2p-evo-git"
    "hytale-f2p-git"
)

source=(
    "${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/F2P%20Evo_${pkgver}_amd64.deb"
    "${_pkgname}.desktop"
)
sha256sums=(
    "4d80d4680f2b04900a4fc55c31ef0fc0a3a89d69d79df58c21e294815208a012"
    "0afc72abdbdfeb59919ff3b18bb3b7933d6c86b0f416cb3e610753b6fce38199"
)

prepare() {
    # Create the source directory and extract the data archive from the .deb package into it
    install -d "${srcdir}/${_pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.deb" --include "data.tar.*" -O | \
        bsdtar -xf - -C "${srcdir}/${_pkgname}-${pkgver}"

    # Remove the original desktop file from the extracted package to replace it with a custom one
    rm "${srcdir}/${_pkgname}-${pkgver}/usr/share/applications/F2P Evo.desktop"
}

package() {
    # Copy all extracted files to the package directory while preserving the directory structure
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/." "${pkgdir}/"

    # Install the custom desktop file with correct permissions to the system applications directory
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
