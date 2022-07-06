# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>

pkgname=cern-phone-app
pkgver=1.1.6
pkgrel=1
pkgdesc="CERNPhone Desktop Application"
arch=('x86_64')
url="https://cernphone.docs.cern.ch/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}.AppImage"
source=("https://cernphone-sw.web.cern.ch/cernphone-sw/releases/cern-phone-app-${pkgver}-x86_64-linux.AppImage.d/${_appimage}")
noextract=("${_appimage}")
sha256sums=('6a4b335e25b0461db3a97d6611770e5ca1d18f11e1e5d8b0051818d88f125081')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|"\
        "squashfs-root/${pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

}
