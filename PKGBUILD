###
# @Author: timochan
# @Date: 2023-06-24 17:09:36
 # @LastEditors: timochan
 # @LastEditTime: 2023-07-11 11:16:01
 # @FilePath: /yakit-appimage/PKGBUILD
###
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: timochan <i@timochan.cn>

_pkgname=yakit
_Pkgname=Yakit
_disname=yakit
major_version=1
minor_version=2
patch_version=2
sp_version='-sp1'
_sp_version='_sp1'

pkgname="${_pkgname}"-appimage
pkgver="${major_version}.${minor_version}.${patch_version}${_sp_version}"
pkgrel=1
pkgdesc="Cyber Security ALL-IN-ONE Platform"
arch=('x86_64')
url="https://github.com/yaklang/yakit"
license=('AGPL-3')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('yakit')


source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}${sp_version}-linux-amd64.AppImage::https://github.com/yaklang/yakit/releases/download/v${major_version}.${minor_version}.${patch_version}${sp_version}/${_Pkgname}-${major_version}.${minor_version}.${patch_version}${sp_version}-linux-amd64.AppImage")
sha256sums_x86_64=('7710ac955675c4f482351b291f1e9f698625f08571feaadf477685f28bef2da1')

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}${sp_version}-linux-amd64.AppImage"
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
    install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" "${pkgdir}/opt/${pkgname}/LICENSE"

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
