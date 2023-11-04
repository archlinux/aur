# Maintainer: irmluity <irmluity@proton.me>

_pkgname=hiddify
pkgname=${_pkgname}-bin
pkgver=v0.10.0
pkgrel=1
pkgdesc="A multi-platform client based on Sing-box that serves as a universal proxy tool-chain."
arch=(x86_64)
url='https://github.com/hiddify/hiddify-next'
license=('CCPL')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=("hiddify")
options=(!strip)
source=(
    "https://github.com/hiddify/hiddify-next/releases/download/${pkgver}/hiddify-linux-x64.zip"
)
sha256sums=(
    "b874ce0468570cd3e161bb1516318cbe49917bfcde18cc117a93d411cc623578"
)
_install_path="/opt/$_pkgname"

prepare() {
    cd "${srcdir}"
    chmod a+x "hiddify-linux-x64.AppImage"
    ./hiddify-linux-x64.AppImage --appimage-extract > /dev/null
    sed -i 's/Exec=/Exec=env /' "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/hiddify-linux-x64.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/hiddify.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/hiddify.png"
    done
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}