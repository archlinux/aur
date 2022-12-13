# Maintainer: Valters Tomsons <valters.tomsons at protonmail dot com>

_appimage="Bridge.AppImage"
_desktop="megascans-bridge.desktop"

pkgname="quixel-bridge"
pkgver=2022.0.8
pkgrel=1
pkgdesc="A tool for browsing, searching, downloading, importing and exporting Megascans assets"
arch=('x86_64')
url="https://quixel.com/bridge"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
source_x86_64=("https://d2shgxa8i058x8.cloudfront.net/bridge/linux/${_appimage}")
noextract=("${_appimage}")
sha256sums_x86_64=('884dfddbf3672e2e46c1332d556e7240dc1fa04013db00739fc75b4206478d9e')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${pkgname}|" \
        "squashfs-root/${_desktop}"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"

    # Icon Iimages
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
}
