# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hathor-wallet-bin
_pkgname="Hathor Wallet"
pkgver=0.27.0_rc5
pkgrel=1
pkgdesc="Hathor Official Wallet for Desktop"
arch=('x86_64')
url="https://hathor.network/"
_githuburl="https://github.com/HathorNetwork/hathor-wallet"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron13'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/HathorNetwork/hathor-wallet/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8dc650886891e3477147ee7de87790ef0757a2856ef271f9f17a0673f58b2261'
            '8fc34ede2d7615b4ef2eee1acfa4a457ab3e7c317e4ba6a1354b3b57ad11cbd0'
            'aa7a6d69fd786660f265a5d5deec11e05ab349e39a68de32deb4919bf3c07806')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}