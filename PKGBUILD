# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-pre-bin
_pkgname=Bettbox
pkgver=1.19.4pre1
pkgrel=3
_pkgver="${pkgver/pre/-pre}"
pkgdesc="A multi-platform proxy client powered by the Mihomo (Clash Meta) core, refactored based on early versions of FlClash. (Build with GOAMD64=v1)"
arch=('x86_64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
conflicts=('bettbox' 'bettbox-compatible' 'bettbox-compatible-pre' 'bettbox-compatible-bin' 'bettbox-bin' 'bettbox-pre' 'bettbox-pre-bin')
provides=("${pkgname%-compatible-pre-bin}=${pkgver}")
depends=(
    'gtk3'
    'libayatana-appindicator'
    'libkeybinder3'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook")
source_x86_64=(
    "${pkgname%-pre-bin}-${pkgver}-${arch}.deb::${url}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver%-pre*}-linux-amd64-compatible.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2')
sha256sums_x86_64=('62cc81b9cebbfe175c99e2471a9264dbc77d8e885527aaed7b836b0ecd350267')

prepare() {
    bsdtar -xf "${srcdir}/data."*
    # Upstream already ships Categories=Network; (line 8), so only the missing
    # StartupWMClass is inserted, right before StartupNotify=true (line 10).
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-compatible-pre-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-compatible-pre-bin}/g
        10i\StartupWMClass=com.appshub.bettbox
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname%-compatible-pre-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-compatible-pre-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-compatible-pre-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-compatible-pre-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-compatible-pre-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-compatible-pre-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-compatible-pre-bin}.png"

    install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

    # Set setuid on BettboxCore for TUN mode (to avoid password prompt)
    chmod u+sx "${pkgdir}/usr/lib/${pkgname%-compatible-pre-bin}/BettboxCore"
}
