# Maintainer: Vitaliy Volynskiy <i at vitalya.me>
# Based on https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=devhub

pkgname="${_pkgname}"-appimage
pkgver=0.102.0
pkgrel=1
pkgdesc="TweetDeck for GitHub - AppImage version"
arch=('x86_64')
url="https://github.com/devhubapp/devhub"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
provides=('devhub')
conflicts=('devhub')
_appimage="${_pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/devhubapp/devhub/releases/download/v${pkgver}/DevHub-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('28620433cf9d36151e21786ed67ba8efc5c0f84517bcbad879a30793e558d2c6')

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

