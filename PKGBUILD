# Maintainer: HORVÁTH, Gergely <horvathg dot 1988 at gmail dot com>

_pkgname=cadassistant
pkgname="${_pkgname}"-appimage
_desktopfilename=cad_assistant
pkgver=1.6.0
pkgrel=1
pkgdesc="Offline 3D CAD viewer and converter, free for personal and commercial use"
arch=('x86_64')
url="https://www.opencascade.com/products/cad-assistant/"
license=('custom')
# depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${_pkgname}_${pkgver}.appimage"
source_x86_64=("${_appimage}::https://www.opencascade.com/sites/default/files/private/occt/applications/cad_assistant_1.6.0_2021-10-05_lin64.appimage"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('06dd8d810d5d5ad7312f152d2dcaff8d9311796edd33aa64314cbec74e80ce54')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=CADAssistant %U|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %U|"\
        "squashfs-root/${_desktopfilename}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    depends=('zlib' 'hicolor-icon-theme' 'fuse2')

    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/cad_assistant/LICENSE.html" "${pkgdir}/opt/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/cad_assistant/LICENSE.rtf" "${pkgdir}/opt/${pkgname}/LICENSE.rtf"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfilename}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE.html" "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE.rtf" "$pkgdir/usr/share/licenses/$pkgname"
}
