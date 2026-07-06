# Maintainer: flarebit15 <flarebit15@8080996.xyz>
#
# AppImage packaging template:
# https://wiki.archlinux.org/title/User:SergeyK/AppImage_package_guidelines

_pkgname=termark

pkgname="${_pkgname}"-appimage
pkgver=1.0.46
pkgrel=1
pkgdesc="Termark 是一款专为现代开发者设计的 SSH 客户端，面向资产管理、终端操作和安全访问等日常工作流"
arch=('x86_64')
url="https://www.termark.app"
# License text not found in Termark's homepage; assuming freeware EULA
license=('custom:EULA')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://f.typesafe.cn/termark/Termark-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('bdd8085f53a58efc129c52554182e8a766822ce1977f5c1813155af6558f2911')

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

