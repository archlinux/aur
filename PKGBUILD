# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mbcord-bin
pkgver=3.0.7
pkgrel=3
pkgdesc="An Emby/Jellyfin rich presence client for Discord"
arch=('x86_64')
url="https://mbcord.sandwichfox.de/"
_githuburl="https://github.com/SandwichFox/MBCord"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/SandwichFox/MBCord/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f93b47d1384c217115373c2e6a4cb93f000aa54687fed7013d8bc91eecc386cd'
            '25f147af5b79f33fbdfbc0b16dcae3db7d19fa67b58f7a95c3d5cabe8638d011'
            'e2b0fd32fbed79a6a1b2059ac40cc4a6ea71c2c0e4422c9cbe96148ca04f38b9')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${srcdir}"
    rm -rf "${srcdir}/app.asar.unpacked/node_modules/register-scheme/build/node_gyp_bins"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}