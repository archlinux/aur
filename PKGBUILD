# Maintainer: Aryan Ghasemi <t.me/gnuphile>
# Contributor: Wang Litao

pkgname="reqable-appimage"
pkgver=3.0.40
_pkgname='reqable'
_archive="$_pkgname-$pkgver"
pkgrel=1
pkgdesc="Reqable is a new generation API debugging and testing solution (HTTP1/2/3)."
arch=('x86_64')
url="https://reqable.com"
license=('custom')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip !debug)
conflicts=(${_pkgname})
provides=(${_pkgname})

prepare() {
    wget "https://pkgs.reqable.com/download/reqable-app-linux-x86_64.AppImage?platform=linux&arch=x86_64&version=${pkgver}&ext=AppImage" -O ${srcdir}/${_archive}.AppImage
    chmod +x "${srcdir}/${_archive}.AppImage"
}

package() {
    install -Dm755 "${srcdir}/${_archive}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    cd "${srcdir}/squashfs-root"

    install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    sed -i "s|Exec=AppRun|Exec=${_pkgname}|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s|Icon=reqable|Icon=${_pkgname}|g" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
