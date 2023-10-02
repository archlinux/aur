_pkgname=sysrescueusbwriter
_pkgver=1.0.2 
_pkgrelease=release_${_pkgver}
_appimage="${_pkgname}-x86_64.AppImage"
_desktopfile="${_pkgname}.desktop"

pkgname=systemrescue-usbwriter-appimage
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool to write SystemRescue to a USB memory stick"
arch=('x86_64')
url="https://gitlab.com/systemrescue/systemrescue-usbwriter"
license=('GPL3')
depends=('fuse2')
conflicts=()
options=(!strip)
source=("${_appimage}::https://fastly-cdn.system-rescue.org/download/usbwriter/${pkgver}/${_appimage}")
sha256sums=('aa3a408942670419802678ef355166d677bb4067e18e836fcca2fa9169721281')

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
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}" "${pkgdir}/usr/share/applications/${_desktopfile}"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/sysrescueusbwriter.png" "${pkgdir}/usr/share/pixmaps/sysrescueusbwriter.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
