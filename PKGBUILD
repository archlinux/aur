# Maintainer: nth233 <fpg2012@foxmail.com>

_pkgname=dida
_version=8.0.10

pkgname="${_pkgname}"-appimage
pkgver="${_version}"
pkgrel=1
pkgdesc="滴答清单（官网 AppImage 版） / Dida (official AppImage version)"
arch=('x86_64')
url="https://www.dida365.com/"
license=('custom')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('dida')
conflicts=('dida-bin')

source=("dida-${pkgver}-x86_64.AppImage")
sha256sums=('66067271d51c4f66f2408a27bce961d1bd96f6e0377b51971cae5644040c72d6')

_appimage="dida-${pkgver}-x86_64.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=dida|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_pkgname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    ln -s "$(realpath "${srcdir}/squashfs-root/${_pkgname}.png" --relative-to "${srcdir}/squashfs-root/usr/share/icons")" \
        "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
