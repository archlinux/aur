# Contributor: Narinas <eatrujillo@protonmail.com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=mindomo-bin
_pkgname=mindomo
pkgver=11.1.9
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information"
arch=('x86_64')
url="https://mindomo.com"
license=('custom:mindomo')
provides=('mindomo')
conflicts=('mindomo')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'zlib')
_app_image="Mindomo_v.${pkgver}_x64.AppImage"
source_x86_64=("$url/download/${pkgver%.*}/${_app_image}")
b2sums_x86_64=('36724d2ec1b15467e6c606263d37cdbb9c2aa67d9a814bf135bb6b4443436c963652609e343bb06fc9b0eab592535631a37798f9d966f03da6b80849d3b58766')
options=(!strip)

prepare() {
   chmod +x "$_app_image"
   ./"${_app_image}" --appimage-extract
}
build() {
    sed -i -E "s|AppRun|env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${_app_image}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/bin"
    cp -a "squashfs-root/usr/share" "${pkgdir}/usr"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
