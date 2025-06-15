# Maintainer: Pedro Lucas <pedrolucasinvestidor62023@gmail.com>

pkgbasename=realm-studio
pkgname="${pkgbasename}"-appimage
pkgver=20.0.0
pkgrel=2
pkgdesc="Graphical tool to open and edit local and synced Realm Databases."
arch=('x86_64')
url="https://github.com/realm/${pkgbasename}"
license=('Apache')
depends=()
options=(!strip)
_appimage="${pkgbasename}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}/releases/download/v${pkgver}/MongoDB.Realm.Studio-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('2eae888eef7e36eee7a25f1c29820daeca3fcaf0094162ebea608d0808cb4213')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgbasename}|"\
        "squashfs-root/${pkgbasename}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgbasename}.desktop"\
            "${pkgdir}/usr/share/applications/${pkgbasename}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgbasename}"
}
