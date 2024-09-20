# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=translationcore-bin
_pkgname=translationCore
pkgver=3.6.6
_subver=MAX-635b02f
_electronversion=25
pkgrel=1
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.translationcore.com/"
_ghurl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'git'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/tC-linux-arm64-${pkgver}-${_subver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/tC-linux-x64-${pkgver}-${_subver}.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/unfoldingWord/translationCore/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('b8818b64e8f1206d7f0a723084d5bbb0fd949757ea75f34d3e47fed765a2fb72')
sha256sums_x86_64=('cf1c740b7659f259586caaa5e48e2147483cf56760c11a5ce7cd62215f9ab14c')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@//
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${_pkgname}|${pkgname%-bin}|g;s|unfoldingword-${pkgname%-bin}|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16 22 32 48 64 128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}