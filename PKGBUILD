# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sofie-chef-bin
_appname=SofieChef
pkgver=0.3.1
pkgrel=1
pkgdesc="Disrupting the industry & stirring pots"
arch=('x86_64')
url="https://github.com/nrkno/sofie-chef"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron26'
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-Linux-Executable.AppImage"
    "LICENSE::https://raw.githubusercontent.com/nrkno/sofie-chef/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0e44704499329d50cbbbca2b0e9213aaadab35447969b9d3b25b55fea0546c75'
            '1885e72fa406407f4135fc914d88aa7b07a74c2a0ce891f74b0224919d6ee57d'
            '7bbf487149e8c0900124e0b51915957e6a8b87eae918837753ece15b3adab5bd')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
