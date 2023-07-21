###
 # @Author: timochan
 # @Date: 2023-07-21 17:47:57
 # @LastEditors: timochan
 # @LastEditTime: 2023-07-21 18:00:07
 # @FilePath: /microsoft-office-appimage/PKGBUILD
### 
# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: timochan <i@timochan.cn>

_pkgname=microsoft-office
_Pkgname=Microsoft-Office
_disname=Microsoft-Office
major_version=2022
minor_version=8
patch_version=1

pkgname="${_pkgname}"-appimage
pkgver="${major_version}.${minor_version}.${patch_version}"
pkgrel=1
pkgdesc="Microsoft Office Desktop App Specially Made for Linux, made with electron: Includes Microsoft Word, Excel, PowerPoint, Outlook, OneDrive, Teams, OneNote, To-Do, Family Safety, Calendar, and Skype."
arch=('x86_64')
url="https://github.com/Comp-Labs/Microsoft-Office"
license=('MIT')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('microsoft-office')

source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}-x86_64.AppImage::https://github.com/Comp-Labs/Microsoft-Office/releases/download/v${major_version}.${minor_version}.${patch_version}/${_Pkgname}-x86_64.AppImage")
sha256sums_x86_64=('008f830c5a033ced818c927249fa6854b9b911a9707eeb569579520dff4404b8')

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-x86_64.AppImage"
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
