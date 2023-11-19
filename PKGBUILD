# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=hiddify.next
pkgname=${_pkgname}-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="A multi-platform proxy app. Auto, SSH, VLESS, Vmess, Trojan, Reality, Sing-Box, Clash, Xray, Shadowsocks"
arch=(x86_64)
url='https://github.com/hiddify/hiddify-next'
license=('CCPL')
depends=('hicolor-icon-theme' 'zlib' 'glibc' 'fuse2')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=('hiddify')
conflicts=(${_pkgname} ${_pkgname}-git)
options=(!strip)
source=(
    "https://github.com/hiddify/hiddify-next/releases/download/v${pkgver}/hiddify-linux-x64.zip"
)
sha256sums=(
    "eb08f622288636acd9f40bc263010df6c92750744b0161fd7f4e842d11650f68"
)
_install_path="/opt/$_pkgname"

prepare() {
    cd "${srcdir}"
    chmod a+x "hiddify-linux-x64.AppImage"
    ./hiddify-linux-x64.AppImage --appimage-extract > /dev/null
    sed -i 's/Exec=/Exec=env /' "${srcdir}/squashfs-root/hiddify.desktop"
}

package() {
    install -Dm755 "${srcdir}/hiddify-linux-x64.AppImage" "${pkgdir}/${_install_path}/hiddify.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/hiddify.desktop" "$pkgdir/usr/share/applications/hiddify.desktop"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/hiddify.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/hiddify.png"
    done
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/hiddify.AppImage" "${pkgdir}/usr/bin/hiddify"
}