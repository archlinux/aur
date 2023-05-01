# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=lx-music-desktop-appimage
pkgver=2.2.2
pkgrel=1
pkgdesc="一个基于electron的音乐软件"
arch=("x86_64")
url="https://github.com/lyswhut/lx-music-desktop"
license=("APACHE")
_pkgname="lx-music-desktop-v${pkgver}-x64.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=("lx-music-desktop")
conflicts=("lx-music-desktop")
depends=('fuse2')
source=("${_pkgname}::https://github.com/lyswhut/lx-music-desktop/releases/download/v${pkgver}/${_pkgname}")
sha512sums=("a837a5b2b0aa6c0c0b3b0d9d16b03959addec01478de75b81c1367fd49f92dd79a1591b0b27d0c151e8e04ad9168a9c78e9ff177bcb49480ddd023f5b1c3190a")

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract >/dev/null
    _desktop_file="${srcdir}/squashfs-root/lx-music-desktop.desktop"
    sed -i "s+Name=lx-music-desktop+Name=LX Music+" ${_desktop_file}
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/lx-music-desktop.AppImage+" ${_desktop_file}
    sed -i "/^Comment=/d" ${_desktop_file}
    sed -i "/^Name[zh_CN]=/d" ${_desktop_file}
    sed -i "3iName[zh_CN]=洛雪音乐助手" ${_desktop_file}
    sed -i "4iComment[zh_CN]=一个免费的音乐查找助手" ${_desktop_file}
    sed -i "4iComment=A free music search helper" ${_desktop_file}
    find "${srcdir}/squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/lx-music-desktop.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/lx-music-desktop.desktop" "${pkgdir}/usr/share/applications/lx-music-desktop.desktop"
    cp -R "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
