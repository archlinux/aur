# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-bin
_pkgname=Bettbox
pkgver=1.18.1
_pkgver="${pkgver/.pre/-pre}"
pkgrel=2
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
source_x86_64=(
    "${pkgname%-compatible-bin}-${pkgver}-${arch}.deb::${url}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver%-pre*}-linux-amd64-compatible.deb"
)
sha256sums_x86_64=('0ad84977a0973b7004a13496104d62461b6e3f1bebdb17a56361972ec071b549')

prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-compatible-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-compatible-bin}/g
        5i\Categories=Network;
        10i\StartupWMClass=com.appshub.bettbox
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    ln -s "/usr/lib/${pkgname%-compatible-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-compatible-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-compatible-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-compatible-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-compatible-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-compatible-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-compatible-bin}.png"
}
