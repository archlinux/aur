# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-pre-bin
_pkgname=Bettbox
pkgver=1.19.7pre1
pkgrel=1
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
    'libayatana-indicator'
    'libkeybinder3'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook" "bettbox.install")
source_x86_64=(
    "${pkgname%-pre-bin}-${pkgver}-${arch}.deb::${url}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver%-pre*}-linux-amd64-compatible.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
sha256sums_x86_64=('08ce2679c58786e9b4458b82582e74a823c665214e9552b6abeec853af5d552a')
install=bettbox.install

prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-compatible-pre-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-compatible-pre-bin}/g
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

    # Polkit rule for resolvectl command; the upstream deb carries it at
    # usr/share/polkit-1/rules.d/, so the package ships that exact file.
    install -Dm644 "${srcdir}/usr/share/polkit-1/rules.d/90-bettbox.rules" \
        "${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"
}
