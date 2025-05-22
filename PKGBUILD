# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Rinne <aur@rinne.in>

_pkgname=animeko
_appimage=ani-4.11.0-alpha02-linux-x86_64.appimage

pkgname=animeko-appimage-alpha
pkgver=v4.11.0_alpha02
pkgrel=1
pkgdesc="集找番、追番、看番的一站式弹幕追番平台，云收藏同步 (Bangumi)，离线缓存，BitTorrent，弹幕云过滤。100% Kotlin/Compose Multiplatform"
arch=('x86_64')
url="https://myani.org"
license=('AGPL-3.0-or-later')
depends=('vlc' 'gvfs')
options=(!strip)
source_x86_64=("${_appimage}::https://github.com/open-ani/animeko/releases/download/v4.11.0-alpha02/ani-4.11.0-alpha02-linux-x86_64.appimage")
noextract=("${_appimage}")
sha1sums_x86_64=('26d33da3ce2a070aca3509cdead5bb766270c5e0')

prepare() {
    chmod +x "${_appimage}"
    rm -rf ./squashfs-root
    # ./"${_appimage}" --appimage-extract
    ./"${_appimage}" --appimage-extract ${_pkgname}.desktop
    ./"${_appimage}" --appimage-extract icon.png
}

build() {
    sed -i -e "s|Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" -e "s|Name=.*|Name=Animeko Alpha|" "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    # chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    cp -a "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    # install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    # ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}