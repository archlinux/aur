# Maintainer: pryme-svg <edoc.www@gmail.com>

_pkgname=qdriverstation

pkgname="${_pkgname}"-appimage
pkgver="21.04"
pkgrel=1
pkgdesc="Cross-platform clone of the FRC Driver Station"
arch=('x86_64')
url="https://github.com/FRC-Utilities/QDriverStation"
license=('MIT')
depends=()
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/FRC-Utilities/QDriverStation/releases/download/v${pkgver}/QDriverStation-${pkgver}-Linux.AppImage"
        "https://raw.githubusercontent.com/FRC-Utilities/QDriverStation/master/LICENSE.md"
       )
noextract=("${_appimage}")
sha256sums=('0b601f1bf3631defec637a105b359624110af0cf1f3901046173bb954ad8946e'
            'f3e0b8f4c98a989ce7363ab1b9b6adb87e99409db674fdc192ea8d1c99adf184')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=${_pkgname}|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/opt/${pkgname}/LICENSE.md"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/pixmaps" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname"
}
