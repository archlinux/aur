# Maintainer: Jonas Karlsson <jonaskarlsson at fripost dot org>

pkgname=notepadnext-appimage
pkgver=0.7
pkgrel=1
pkgdesc="Cross-platform reimplementation of Notepad++ (binary AppImage)"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
conflicts=('notepadnext-git' 'notepadnext')
options=('!strip')
_appimage="NotepadNext-v0.7-x86_64.AppImage"
_svgpath="usr/share/icons/hicolor/scalable/mimetypes"
_desktoppath="usr/share/applications"
_pkgname="${pkgname%-appimage}"
noextract=("${_appimage}")
source_x86_64=(
    "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
)
sha256sums_x86_64=('cb70f183a9e25e40ccc7612011110ef695a0aa37cbdeb8ccd53dfee1d005872c')

prepare() {
    chmod +x ${srcdir}/${_appimage}
    ${srcdir}/${_appimage} --appimage-extract ${_desktoppath}/NotepadNext.desktop
    ${srcdir}/${_appimage} --appimage-extract ${_svgpath}/NotepadNext.svg
    # Fix desktop Exec name
    sed -i 's/Exec=NotepadNext/Exec=notepadnext/g' \
        ${srcdir}/squashfs-root/${_desktoppath}/NotepadNext.desktop
}

package() {
    # Install AppImage
    install -Dm 755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    # Install svg file
    install -Dm 644 "${srcdir}/squashfs-root/${_svgpath}/NotepadNext.svg" \
        "${pkgdir}/${_svgpath}/NotepadNext.svg"
    # Install Desktop file
    install -Dm 644 "${srcdir}/squashfs-root/${_desktoppath}/NotepadNext.desktop" \
        "${pkgdir}/${_desktoppath}/NotepadNext.desktop"
    # Symlink executable
    install -dm 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
