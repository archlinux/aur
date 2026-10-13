# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>
pkgname=pdf-metadata-editor-bin
_pkgname=pdf-metadata-editor
pkgver=4.4.0
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

sha512sums_x86_64=('6a683de3dbb3f0221cd44fc59ea185af08e3ce2df59c41299afa34346aea5a9e8491a34093902b9227b0c9495adc226abe8bcff05e46a25444f5934c8355a204')
sha512sums_aarch64=('ba005d7bf61765e54f10016ccebd9e87c7a74c06e50cb7fb32492b745a7dd1f77f2885d8b0921703f819fa77cf045100b08525e9145a9a07903b084b395039d2')

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
