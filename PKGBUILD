# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-bin
_pkgname=Bettbox
pkgver=1.18.0
_pkgver="${pkgver/.pre/-pre}"
pkgrel=1
pkgdesc="A multi-platform proxy client powered by the Mihomo (Clash Meta) core, refactored based on early versions of FlClash. (Build with GOAMD64=v1)"
arch=('x86_64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-compatible-bin}" "${pkgname/-compatible}")
provides=("${pkgname%-compatible-bin}=${pkgver}")
depends=(
    'libayatana-appindicator'
    'libkeybinder3'
)
options=('!debug')
source=(
    "${pkgname%-compatible-bin}.sh"
)
source_x86_64=(
    "${pkgname%-compatible-bin}-${pkgver}-${arch}.deb::${url}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver%-pre*}-linux-amd64-compatible.deb"
)
sha256sums=('efe4503308a1e4e44b892065b6fb8f582bd2f7d01e3f0232e4d86539101ebbb5')
sha256sums_x86_64=('f1892fdb1290ab88d2784b65e1572567289bd45678cbdd87f52a730e3d48f40e')

prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-compatible-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-compatible-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-compatible-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-compatible-bin}/g
        5i\Categories=Network;
        10i\StartupWMClass=com.appshub.bettbox
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-compatible-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-compatible-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-compatible-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-compatible-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-compatible-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-compatible-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-compatible-bin}.png"
}
