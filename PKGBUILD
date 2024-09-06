# Maintainer: Xuanwo

_pkgname=follow

pkgname="${_pkgname}"-bin
pkgver=0.0.1_alpha.10
pkgrel=1
pkgdesc="Next generation information browser"
arch=('x86_64')
url="https://github.com/RSSNext/Follow"
license=('GPL-3.0-or-later')
options=(!strip)
_appimage="Follow-${pkgver//_/-}-linux-x64.AppImage"
source_x86_64=("${_appimage}::https://github.com/RSSNext/Follow/releases/download/v${pkgver//_/-}/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('626c18f164083f2dff619f65b2c7a483168b36930f5f67b2d4832aa37e63f354')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=Follow|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/Follow.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/Follow.desktop"\
            "${pkgdir}/usr/share/applications/Follow.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
