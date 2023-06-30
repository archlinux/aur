# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-react-boilerplate-bin
pkgver=4.6.0
pkgrel=1
pkgdesc="A Foundation for Scalable Cross-Platform Apps"
arch=('x86_64')
url="https://electron-react-boilerplate.js.org/"
_githuburl="https://github.com/electron-react-boilerplate/electron-react-boilerplate"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libdbusmenu-glib' 'libxdamage' 'bash' 'libdrm' 'at-spi2-core' 'dbus' 'libxcomposite' 'glibc' 'gdk-pixbuf2' 'gcc-libs' \
    'nspr' 'gtk3' 'libxkbcommon' 'libxfixes' 'alsa-lib' 'cairo' 'libxcb' 'libcups' 'hicolor-icon-theme' 'libx11' 'glib2' \
    'libxrandr' 'mesa' 'pango' 'nss' 'libxext' 'expat' 'gtk2' 'dbus-glib')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/ElectronReact-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/electron-react-boilerplate/electron-react-boilerplate/main/LICENSE")
sha256sums=('cd8f574f85865c8d64475e70a4efc21ac405b1a93db2f8c462932e9df008b71f'
            '5e98c15fe806a18f79422d2cd0c4587129f4e03081b5ab4c030627d6f6840d68')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}