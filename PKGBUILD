# Maintainer: envolution

pkgname='goxel-voxel-editor-bin'
_pkgname='goxel'
appname='goxel'
pkgver=0.15.1
pkgrel=2
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux. Release version."
arch=('i686' 'x86_64')
url="https://goxel.xyz/"
license=('GPL3')
depends=(glfw gtk3)
provides=('goxel-voxel-editor')
conflicts=('goxel-voxel-editor')
options=(!strip !debug)
_appimage="${_pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/guillaumechereau/goxel/releases/download/v${pkgver}/goxel-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('1dbbdb4f0870f2f7722448c22c7a586090aa6ad20b06c574ddde801b669b3f62')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=${appname}|Exec=env DESKTOPINTEGRATION=false /usr/bin/${appname}|"\
        "squashfs-root/${appname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    #install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${appname}.desktop"\
            "${pkgdir}/usr/share/applications/${appname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${appname}"

    # Symlink license
    #install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    #ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
