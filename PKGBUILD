# Maintainer: Marcio Silva <marcionps at gmail dot com>

_pkgname=amazingmarvin

pkgname="${_pkgname}"-appimage
pkgver=1.54.0
pkgrel=1
pkgdesc="Personal productivity app that incorporates principles from behavioral psychology to help you beat procrastination, feel in control and finish your to-do list"
arch=('x86_64')
url="https://amazingmarvin.com/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://amazingmarvin.s3.amazonaws.com/Marvin-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('cfef257d7c71d775e30277989c3fc633533fde8ee984cec858bd2f552030d129')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/marvin.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/marvin.desktop"\
            "${pkgdir}/usr/share/applications/marvin.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
