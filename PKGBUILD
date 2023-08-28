###
# @Author: timochan
# @Date: 2023-08-23 11:02:41
 # @LastEditors: timochan
 # @LastEditTime: 2023-08-28 12:42:39
 # @FilePath: /qplugged-appimage/PKGBUILD
###
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: timochan <i@timochan.cn>

_pkgname=q-plugged
_Pkgname=Q-plugged
_disname=q-plugged
major_version=0
minor_version=7
patch_version=0

pkgname="${_pkgname}"-appimage
pkgver="${major_version}.${minor_version}.${patch_version}"
pkgrel=1
pkgdesc="一个支持所有桌面平台的 IM 前端界面"
arch=('x86_64')
url="https://github.com/QPlugged/QPlugged"
license=('AGPL-3')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('q-plugged')

source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-amd64.AppImage::https://github.com/QPlugged/QPlugged/releases/download/qplugged-v${major_version}.${minor_version}.${patch_version}/qplugged_amd64.AppImage")
sha256sums_x86_64=('0723160d22aaae9bdcf76328024dc7a7ff7d462721f15f140cd8151ec5b125c4')

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-amd64.AppImage"
noextract=("${_appimage}")

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        "squashfs-root/${_disname}.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png --relative-to ${srcdir}/squashfs-root/usr/share/icons)" \
        "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
