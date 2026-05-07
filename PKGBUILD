# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Gelmo <gelmo[at]outlook.com>

_pkgname=touchportal
appname=TouchPortal

pkgname="${_pkgname}"-appimage
pkgver=4.5.0
pkgrel=1
pkgdesc="Remote macro control deck for PC and Mac OS for streamers, content creators and other professionals"
arch=('x86_64')
url="https://www.touch-portal.com"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
_appimage="${appname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://www.touch-portal.com/downloads/releases/linux/TouchPortal.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('1f2cc0f9854aa1d95b474262a701eb2bb86cb41981dbc4ee65b6aaa8b751d1a7')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=${appname}|Exec=env DESKTOPINTEGRATION=false APPIMAGELAUNCHER_DISABLE=true /usr/bin/${_pkgname}|"\
        "squashfs-root/${appname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${appname}.desktop"\
            "${pkgdir}/usr/share/applications/${appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
