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
options=(!strip)
source=(
    "https://github.com/hiddify/hiddify-next/releases/download/${pkgver}/hiddify-linux-x64.zip"
    "app_icon_16.png"
    "app_icon_32.png"
    "app_icon_64.png"
    "app_icon_512.png"
    "app_icon_1024.png"
)
sha256sums=(
    "b874ce0468570cd3e161bb1516318cbe49917bfcde18cc117a93d411cc623578"
    "59eebffd71b80047771a8ba7942f47f8a7a4fe7c8b01eb062d0ef38acee14380"
    "0cfba7efa896a96dd2734c5c5049ae53f73b4d075f1da1003288a777b88ee2d8"
    "16bc8f1417cf5f42ed1d1a3531e22c552d2aaf1ef2bcac4af9440c6e99018709"
    "850737acbbe490ecf367782398d268ea6c5bfc7e1703912dd82da3e14ab2750a"
    "fb7995d5fbe8a76a64ad2fa31cc34e4097c2df0717c70b4efde4a81a3b5e01f2"
)
_install_path="/opt/$_pkgname"

prepare() {
    cd "${srcdir}"
    chmod a+x "hiddify-linux-x64.AppImage"
    ./hiddify-linux-x64.AppImage --appimage-extract > /dev/null
    sed -i 's/Exec=/EXEC=env /' "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/hiddify-linux-x64.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/hiddify.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/hiddify.png"
    done

    for _icons in 16 32 64 512 1024;do
        install -Dm644 "${srcdir}/app_icon_${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/hiddify.png"
    done

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}