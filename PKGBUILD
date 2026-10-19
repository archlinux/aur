# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=4.4.1
pkgrel=1
pkgdesc="A simple, cross-platform desktop application for viewing and editing PDF metadata"
arch=('x86_64' 'aarch64')
url="https://github.com/zaro/pdf-metadata-editor"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-1_arm64.deb")

sha512sums_x86_64=('e1d1a97177e162aaaad14f930cc31a7ebd6e0b008fe93c409845f2bc1cfa006d32c751095a5e56d04a6e5523967cb5c5c91f69c7a19dc7d0ba6aa5c96f302230')
sha512sums_aarch64=('5a16dbc4f892dabf5a121d0acabef79f4586eb0c1c4fc9b06820bad728a8eefe039b0f104564532b45fe73ed5afc86497bb81cec9d4f1f7ca911da730f67ebe1')

package() {
    # Extract data.tar.zst from .deb
    bsdtar -xf data.tar.zst -C "${pkgdir}"

    # Create symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/bin/Pdf Metadata Editor" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install .desktop file
    install -d "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-Pdf_Metadata_Editor.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install icon
    install -d "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/Pdf_Metadata_Editor.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # Fix .desktop file Exec and Icon
    sed -i "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s|Icon=.*|Icon=${_pkgname}|" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
