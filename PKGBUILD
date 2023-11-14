# Maintainer: Shreyans Jain <shreyansthebest2007@gmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=google-assistant-unofficial-desktop-client-bin
_appname=g-assist
_pkgname="Google Assistant"
pkgver=1.1.0
pkgrel=7
pkgdesc="A cross-platform unofficial Google Assistant Client for Desktop (powered by Google Assistant SDK)"
arch=('x86_64')
url="https://github.com/Melvin-Abraham/Google-Assistant-Unofficial-Desktop-Client"
license=('Apache')
depends=(
    'electron10'
    'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::$url/releases/download/v$pkgver/${_pkgname// /-}-Setup-${pkgver}-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('97ef51b6950d14ac0bc34aa5705b125b09d67d0f5e5cafa686f7757ff751a510'
            'e13c8b11c230975ef1c1c788103bc701515ecdcc1816fb307e3c965694242757')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${_appname}\" %U|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g;s|Productivity|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}