# Maintainer: Jonas Karlsson <jonaskarlsson at fripost dot org>

pkgname=notepadnext-appimage
pkgver=0.6.4
pkgrel=1
pkgdesc="Cross-platform reimplementation of Notepad++ (binary AppImage)"
arch=('x86_64')
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
conflicts=('notepadnext-git' 'notepadnext')
options=('!strip')
_appimage="NotepadNext-v0.6.4-x86_64.AppImage"
_svgpath="usr/share/icons/hicolor/scalable/mimetypes"
_desktoppath="usr/share/applications"
_pkgname="${pkgname%-appimage}"
noextract=("${_appimage}")
source_x86_64=(
    "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
)
sha256sums_x86_64=('b26e2d5208bce3b70847f1b7c5f863cd7567bd476dd3df68ad433c700564a089')

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
