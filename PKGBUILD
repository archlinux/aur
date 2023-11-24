# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=overte
pkgname=${_pkgname}-appimage
pkgver=2023.11.1
pkgrel=1
pkgdesc="Overte open source virtual worlds platform. "
arch=('x86_64')
url="https://github.com/overte-org/overte"
license=('APACHE')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/overte-org/overte/releases/download/${pkgver}/Overte-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('21f2e5bc0004ddbf0e2973950b84f672f464cf932e78468eb535c659730ebebc')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname^} %u|"\
        "squashfs-root/org.overte.interface.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/org.overte.interface.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname^}.desktop"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname^}"
}
