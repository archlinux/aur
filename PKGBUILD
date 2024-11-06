# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jm-desktop-bin
pkgver=1.8.1
_electronversion=33
pkgrel=1
pkgdesc="A jm comic desktop app by react + electron.Prebuilt version.一个禁漫的第三方客户端"
arch=('x86_64')
url="https://github.com/Dedicatus546/jm-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'alsa-lib'
    'nspr'
    'gtk3'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-${pkgver}.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Dedicatus546/jm-desktop/v${pkgver}/public/png/512x512.png"
)
sha256sums=('432b84df8554fdc3ed3f06a7331e5ceddfb65242f6cefbb3ed38e2b4e312b366'
            'b09140b89c05bcf1bfa0f0db74aa55f83b4fdbc4cd6955efeb539631f57d4528')
build() {
    install -Dm755 -d "${srcdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    find "${srcdir}/usr/lib/${pkgname%-bin}" -type d -exec chmod 755 {} +
}
package() {
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
