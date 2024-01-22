# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=grinplusplus-bin
_pkgname=GrinPlusPlus
pkgver=1.2.8
pkgrel=6
pkgdesc='A C++ Grin Node & Wallet For Linux'
arch=('x86_64')
url="https://grinplusplus.github.io"
_ghurl="https://github.com/GrinPlusPlus/GrinPlusPlus"
license=('MIT')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'nss'
    'openssl-1.1'
    'alsa-lib'
    'at-spi2-core'
    'libxcb'
    'mesa'
    'nodejs'
    'perl'
    'python'
    'python-setuptools'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/GrinPlusPlus/GrinPlusPlus/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
options=('!strip')
sha256sums=('9d331477bec4bf78a54e0169ca862d5a269ca5e62ec27fc2897a0e6916d5621a'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53'
            '5ec6bd606a11c0359793c48b790ccdc50604142d67ba0004d1a8ee71a9dd11de')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname//Plus/+}/${pkgname%-bin}\" %U|${pkgname%-bin} --no-sandbox %U|g;s|Finance|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname//Plus/+}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}