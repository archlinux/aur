# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=utools-bin
_pkgname=uTools
pkgver=5.0.0
_electronversion=22
pkgrel=2
pkgdesc="uTools Utilities.新一代效率工具平台,自由组合插件应用,打造专属你的趁手工具集"
arch=("x86_64")
url="https://u.tools"
_ghurl="https://github.com/uTools-Labs"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'nspr'
    'gtk3'
    'nss'
    'alsa-lib'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://open.u-tools.cn/download/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.html::${url}/agreement.html"
)
sha256sums=('9e593a44b82cd1743f121b4c6848194b53bd67e6736fe2a3de8d9beb3b7570cb'
            '79ece83ed12ba8fe68f7ae40af48df0e3e8f23fcb0f1cae6908fa14221cbab64')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/opt" "${pkgdir}"
    ln -sf "/opt/${_pkgname}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}