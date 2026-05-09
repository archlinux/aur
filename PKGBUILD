# Contributor: Narinas <eatrujillo@protonmail.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=mindomo-bin
_pkgname=mindomo
pkgver=11.1.8
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information"
arch=('x86_64')
url="https://mindomo.com"
license=('custom:mindomo')
provides=('mindomo')
conflicts=('mindomo')
depends=('fuse2')
_app_image="Mindomo_v.${pkgver}_x64.AppImage"
source_x86_64=("$url/download/${pkgver%.*}/${_app_image}")
b2sums_x86_64=('78ca035c5cce9ad2c5096eabdee4043ad1aa56d6fa856ffb97ca51e6f84d0b744e489786f5c73d2267623f72ecc67228315a9393aaf0a4da98d434a31045f7bb')
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
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/${_app_image}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/share"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
