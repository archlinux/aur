# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easytv-bin
_pkgname=easyTV
pkgver=2.9.0
pkgrel=1
pkgdesc="A lightweight IPTV player, supports all platforms and Android TV big screens. Welcome to download and experience!(Prebuilt version)一款轻量级IPTV播放器"
arch=('x86_64')
url="https://github.com/aiyakuaile/easy_tv_live"
license=('CC-BY-NC-SA-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'libpulse'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/aiyakuaile/easy_tv_live/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('94a98d6f1e15676a557da6200134c0fb7818e0152478debb68682af58f1bda67'
            'ed29e69fccc7077eb337382e4b22599586eadb471e18198e59ad0c8219752be8'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}