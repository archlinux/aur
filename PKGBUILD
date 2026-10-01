# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-bin
_pkgname=Bettbox
pkgver=1.19.4
pkgrel=1
pkgdesc="A multi-platform proxy client powered by the Mihomo (Clash Meta) core, refactored based on early versions of FlClash. (Build with GOAMD64=v1)"
arch=('x86_64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
conflicts=('bettbox' 'bettbox-compatible' 'bettbox-compatible-pre' 'bettbox-bin' 'bettbox-pre' 'bettbox-compatible-pre-bin' 'bettbox-pre-bin')
provides=("${pkgname%-compatible-bin}=${pkgver}")
depends=(
    'gtk3'
    'libayatana-appindicator'
    'libkeybinder3'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook")
source_x86_64=(
    "${pkgname%-compatible-bin}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64-compatible.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2')
sha256sums_x86_64=('280b8d16d6d79e1b8ce7339969362ad60f38a37b63e1e5a1b4d0ca5b82fe8e07')

prepare() {
    bsdtar -xf "${srcdir}/data."*
    # Upstream already ships Categories=Network; (line 8), so only the missing
    # StartupWMClass is inserted, right before StartupNotify=true (line 10).
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-compatible-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-compatible-bin}/g
        10i\StartupWMClass=com.appshub.bettbox
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname%-compatible-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-compatible-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-compatible-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-compatible-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-compatible-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-compatible-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-compatible-bin}.png"

    install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

    # Set setuid on BettboxCore for TUN mode (to avoid password prompt)
    chmod u+sx "${pkgdir}/usr/lib/${pkgname%-compatible-bin}/BettboxCore"
}
