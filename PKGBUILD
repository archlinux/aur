# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nexus_wallet
pkgname="${_pkgname//_/-}-bin"
_appname='Nexus Wallet'
pkgver=3.1.5
_electronversion=22
pkgrel=2
pkgdesc="The official Logical and Interface layers of the Nexus Software Stack.(Prebuilt version)"
arch=('x86_64')
url="https://crypto.nexus.io/wallet"
_ghurl="https://github.com/Nexusoft/NexusInterface"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Nexusoft/NexusInterface/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1748de2ba5b6739cd98245d74dcb86f6171bf790a4d0ce4de04f44a1e0eb2181'
            'e7ee68282295100c6be4565152cb535d43086d2354760a8f006f1e980e0a3bb5'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\"\/opt\/${_appname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/P2P/Network/g
        s/${_pkgname}/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/build" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    find "${srcdir}/app.asar.unpacked/build" -type f -exec sed -i "s/\"..\",\"resources\"/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}