# Maintainer: Matthew Blankenbehler <spectrino3d@gmail.com>

_pkgname=satisfactory-mod-manager

pkgname="${_pkgname}"-appimage
pkgver=2.9.3
pkgrel=1
pkgdesc="Satisfactory Mod Manager (appimage)"
arch=('x86_64')
url="https://github.com/satisfactorymodding/SatisfactoryModManager"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}.AppImage"
source_x86_64=("${_appimage}::https://github.com/satisfactorymodding/SatisfactoryModManager/releases/download/v${pkgver}/${_pkgname}.AppImage"
               "https://raw.githubusercontent.com/satisfactorymodding/SatisfactoryModManager/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('2881dd7dd99bdb287bd1eeae4af246db89b98e3c0cc359c006188d06f10f7a04'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
conflicts=('satisfactory-mod-manager')
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/satisfactory-mod-manager-gui.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/satisfactory-mod-manager-gui.desktop"\
            "${pkgdir}/usr/share/applications/satisfactory-mod-manager-gui.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
