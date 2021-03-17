# Maintainer: Chee Sing Lee <cheesinglee@gmail.com>

_pkgname=flexvdi-client

pkgname="${_pkgname}"-appimage
pkgver=3.1.6
pkgrel=1
pkgdesc="Client for connecting to flexVDI desktops"
arch=('x86_64')
url="https://flexvdi.com/en/downloads"
license=('custom:Unlicense')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}-x86_64.AppImage"
source_x86_64=("${_appimage}::http://depot.flexvdi.com/clients/linux-x86_64/flexvdi-client-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
md5sums_x86_64=('2507624190a5015e75d7ed989be7bd93')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=flexvdi-client|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    sed -i -E "s|Icon=icon|Icon=flexvdi-client|" "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    cp -a "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/flexvdi-client.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
