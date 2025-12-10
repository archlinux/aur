# Contributor: Narinas <eatrujillo@protonmail.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=mindomo-bin
_pkgname=mindomo
pkgver=11.1.4
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information."
arch=('x86_64')
url="https://mindomo.com"
license=('custom:mindomo')
provides=('mindomo')
conflicts=('mindomo')
depends=('fuse2')
_app_image="Mindomo_v.${pkgver}_x64.AppImage"
source_x86_64=("$url/download/${pkgver%.*}/${_app_image}")
sha256sums_x86_64=('85330d5abf8bdaa2c715871a6864c492617a3d685b2e722c110ee750cac80049')
options=(!strip)

prepare() {
   chmod +x "$_app_image"
   ./"${_app_image}" --appimage-extract
}
build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "${srcdir}/${_app_image}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

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

# vim:set noet sts=0 sw=4 ts=4:
