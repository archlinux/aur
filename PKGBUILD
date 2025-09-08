# Maintainer: Manuel Solimano <masolimano at uc dot cl>

pkgname=carta-appimage
_pkgname="carta"
pkgver=5.0.3
pkgrel=1
pkgdesc="Cube Analysis and Rendering Tool for Astronomy"
arch=('x86_64')
url="https://cartavis.org"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme' 'libidn11' 'rtmpdump')
options=(!strip)
_appimage="carta-x86_64.AppImage"
source_x86_64=("${pkgname}-v${pkgver}-stable.${pkgrel}.tgz::https://github.com/CARTAvis/carta/releases/download/v${pkgver}/carta.AppImage.x86_64.tgz"
               "LICENSE::https://raw.githubusercontent.com/CARTAvis/carta-backend/v${pkgver}/COPYING.md"
              )
noextract=("${_appimage}")
sha256sums_x86_64=(
 '91f25893a1719f2973dbb13f0e5bbac6343abf7041da6071d24a7cf08614611f'
 '26c03bc049c15fc5b9e52d791a06f1a6bc32f89edc8f8c701ab0aadf66e85b82')
                   

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    sed -i -E "s|Icon=carta|Icon=cartaviewer|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

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
