# Maintainer: Aaron Roque Fonseca <aaronroquefonseca@gmail.com>
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=orca-slicer
pkgname=${_pkgname}-appimage-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="OrcaSlicer AppImage — prebuilt AppImage with reliable viewport rendering on newer NVIDIA (nvidia-open); avoids heavy compilation and common install failures of other AUR variants."
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('fuse2' 'hicolor-icon-theme' 'webkit2gtk')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/OrcaSlicer_Linux_AppImage_V${pkgver}.AppImage"
               "https://raw.githubusercontent.com/SoftFever/OrcaSlicer/refs/tags/v${pkgver}/LICENSE.txt")
noextract=("${_appimage}")
sha256sums_x86_64=('73079d88ec36f0615db7919d00aa26fe301e348ba6e051862a7cfc4040150c03' '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')

prepare() {
    chmod +x "${_appimage}"
    ./${_appimage} --appimage-extract
}

build() {
    # Adjust Exec line in the .desktop file found at the root of the AppImage
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" squashfs-root/OrcaSlicer.desktop
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # Install AppImage in /opt
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Install license
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    # Install desktop entry from AppImage root
    install -Dm644 "${srcdir}/squashfs-root/OrcaSlicer.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install icon from AppImage root
    install -Dm644 "${srcdir}/squashfs-root/OrcaSlicer.png" "${pkgdir}/usr/share/pixmaps/OrcaSlicer.png"

    # Create wrapper script in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
