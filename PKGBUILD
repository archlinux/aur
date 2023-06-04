# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apple-music-electron-appimage
pkgver=3.0.2
pkgrel=1
pkgdesc="A free, lightweight, open source alternative to iTunes and other Apple Music applications based on Electron 15"
arch=('x86_64')
url="https://github.com/Alex313031/Apple-Music-Electron"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Apple.Music-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/Apple-Music-Electron/master/LICENSE")
sha256sums=('3ffbc3086026ef189b85657b479bd8fbc7dd504534096dc55c3e6d1761f1160c'
            '2fef7133abc6fd2dc02cb7402696cf54cd6387e4259d86cd670e4a61f94d6f63')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}|g;s|Icon=apple-music|Icon=apple-music|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}