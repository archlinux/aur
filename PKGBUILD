# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="crankshaft-client-bin"
pkgver=1.8.0
pkgrel=1
pkgdesc="A fast, feature-rich krunker client written in typescript"
arch=('i686' 'x86_64')
url="https://github.com/KraXen72/crankshaft"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('electron' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}.sh")
source_i686=("${pkgname%-bin}-${pkgver}-i686.AppImage::${url}/releases/download/${pkgver}/${pkgname%-client-bin}-portable-linux-i386.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${pkgname%-client-bin}-portable-linux-x86_64.AppImage")
sha256sums=('c2c4f2c44cdf78851af400fbe7dc16c96b04726da39efc7c65aaeb687dee83a3')
sha256sums_i686=('e2de6a1520e5385cace8828cc1dba0cb9c301e6c89c3d08f6f0e9dfb914f6c0b')
sha256sums_x86_64=('f6012189d8c76bb08fb6a54a03e2fde6d0c089900f83bc9e661ef015cf5713e7')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {    
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-client-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-client-bin}|Icon=${pkgname%-bin}|g;s|game|Game|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-client-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-client-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}