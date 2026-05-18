# Maintainer: fr0stb1rd - fr0stb1rd.gitlab.io
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=4.2.0
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

sha512sums_x86_64=('cfb2979621f486af95c455e6d6a7c5c6f78501377bd134a2aad113d00b66236763d596b151e1fd21fb289c56e265628d8a7d5c4011890d91676c6a74b21929f1')
sha512sums_aarch64=('c5a4fc2fb814b6bdb462f856559ed44c4edc2a702d9d83c100fed55623a6f69acaf6f3115f70a9e79bc7e3927e68b09e9a9f8a257055ff5337f0a0c3a3c0126b')

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
