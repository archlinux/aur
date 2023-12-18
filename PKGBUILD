# Maintainer: Light Ning <aur at i01 dot io>
# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=botim

pkgname="${_pkgname}"-appimage
pkgver=1.7.5
pkgrel=0
pkgdesc="BOTIM - Free, Secure & Reliable Messages and Calls"
arch=('x86_64')
url="https://botim.me"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'botim-bin')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://cdn-web-sg.botim.me/downloads/desktop/linux/${pkgver}/Botim-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('9841933e77a3c08436dbce425ecf1adfc67c4a843378a93408de4151a6fbb0d7')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
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
