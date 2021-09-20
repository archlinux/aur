# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: oscareczek <oscareczek at gmail dot com>

_pkgname=yuna

pkgname="${_pkgname}"-appimage
pkgver=1.4.23
pkgrel=1
pkgdesc='Anime player & list manager integrating AniList, Simkl, Crunchyroll, and Hidive'
arch=(x86_64)
url='https://yuna.moe'
license=(AGPL3)
depends=('gtk3' 'libxss' 'nss')
conflicts=("${_pkgname}")
options=(!strip)
_appimage="Yuna-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/BeeeQueue/${_pkgname}/releases/download/v${pkgver}/${_appimage}")
sha512sums=('a8371f2aeef08c9ec850bbedd621b486b50367d20787fb7b99ebe83b3b2ec2c5435302a7de478f644b470a3607abffbda90c915b097a55808ab670e329d11b8e')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
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
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
