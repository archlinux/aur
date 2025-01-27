# Maintainer: ikyope at outlook dot com

pkgname=lx-music-desktop-appimage
pkgver=2.10.0
pkgrel=1
pkgdesc="一个免费&开源的音乐查找工具"
arch=("x86_64")
url="https://github.com/lyswhut/lx-music-desktop"
license=("Apache-2.0")
_pkgname="lx-music-desktop_${pkgver}_x64.AppImage"
noextract=(${_pkgname})
options=("!strip" "!debug")
depends=("fuse2")
source=("${_pkgname}::https://github.com/lyswhut/lx-music-desktop/releases/download/v${pkgver}/${_pkgname}")
md5sums=("08e31eb49eb8023f4cde53629e8d8c40")
_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    _desktop_file="squashfs-root/lx-music-desktop.desktop"
    sed -i "s+^Exec=AppRun+Exec=${_installdir}/lx-music-desktop.AppImage+" ${_desktop_file}
    sed -i "s+^Icon=.*+Icon=lx-music-desktop-appimage+" ${_desktop_file}
    sed -i "/^Comment=/d" ${_desktop_file}
    sed -i "4iComment[zh_CN]=一个免费&开源的音乐查找工具" ${_desktop_file}
    sed -i "4iComment=An Electron-based music software" ${_desktop_file}
}

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/lx-music-desktop.AppImage"
    install -Dm644 "squashfs-root/lx-music-desktop.desktop" "${pkgdir}/usr/share/applications/lx-music-desktop-appimage.desktop"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" squashfs-root/resources/licenses/{license.rtf,license_en.txt,license_zh.txt}

    for icon_size in "16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512"; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${icon_size}/apps/lx-music-desktop.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}/apps/lx-music-desktop-appimage.png"
    done

}
