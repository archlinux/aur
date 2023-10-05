# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer : Sergey Kostrukov <sergey at kostrukov dot com>
# Contributor : Tianrui Wei <archlinux_aur at mail dot tianrui-wei dot com>
# Contributor : Marcio Silva <marcionps at gmail dot com>

_pkgname=todoist

pkgname="${_pkgname}"-appimage
pkgver=8.8.2
pkgrel=1
pkgdesc="The to-do list to organize work & life."
arch=('x86_64')
url="https://todoist.com/"
license=('custom:Commercial')
depends=('zlib' 'fuse2')
optdepends=('appimagelauncher: desktop integration')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://electron-dl.todoist.com/linux/Todoist-linux-x86_64-${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('dd22d421a15f1a2e79d21ef62a257ce64db7d66a5f55d89095123e2a16224888')

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

    # Icon 
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/todoist.png" "${pkgdir}/usr/share/pixmaps"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

