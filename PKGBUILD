_pkgname=eiskaltdcpp-qt
_pkgver=2.4.2
_pkgrelease=release_${_pkgver}
_appimage="${_pkgname}-${_pkgver}-x86_64.AppImage"
_desktopfile="eiskaltdcpp-qt.desktop"

pkgname=eiskaltdcpp-qt-appimage
pkgver=2.4.2
pkgrel=2
pkgdesc="Qt5-based DC and ADC client for EiskaltDC++ core. Qt, appimage version"
arch=('x86_64')
url="https://sourceforge.net/projects/eiskaltdcpp/"
license=('GPL3')
depends=()
conflicts=('eiskaltdcpp-qt' 'eiskaltdcpp-qt-git')
options=(!strip)
source=("${_appimage}::https://sourceforge.net/projects/eiskaltdcpp/files/Linux/${_appimage}/download")
sha256sums=('84c794afb7d7edea9b93d4c8e472ba8b18cc3d10a4f9fcbb12890a4fa659c8c4')

prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract > /dev/null
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/eiskaltdcpp.png" "${pkgdir}/usr/share/pixmaps/eiskaltdcpp.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

