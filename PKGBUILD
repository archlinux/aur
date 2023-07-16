# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
_pkgnameU=Converter432Hz
_pkgname=converter432hz
pkgname=${_pkgname}-appimage
pkgver=3.2
pkgrel=1.1
pkgdesc="Converts and re-encodes music to 432Hz"
arch=('x86_64')
url="https://github.com/mysteryx93/NaturalGroundingPlayer/wiki/432hz-Batch-Converter"
license=('MIT')

options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mysteryx93/NaturalGroundingPlayer/releases/download/v${pkgver}/${_pkgnameU}-${pkgver}_Linux_x64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('5fb2ccf5665f843b6bdd190c78a02cc96785fef6df8938a93f5b5bd6483d0f88')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgnameU} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    #install -dm755 "${pkgdir}/usr/share/"
    #cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgnameU}"
}
