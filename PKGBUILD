# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-bin
_pkgname=Bettbox
pkgver=1.19.7
pkgrel=1
pkgdesc="A cross-platform network traffic routing and DNS debugging tool, deeply built on the powerful Mihomo core. (Build with GOAMD64=v1)"
arch=('x86_64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
conflicts=('bettbox' 'bettbox-compatible' 'bettbox-compatible-pre' 'bettbox-bin' 'bettbox-pre' 'bettbox-compatible-pre-bin' 'bettbox-pre-bin')
provides=("${pkgname%-compatible-bin}=${pkgver}")
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
    "${pkgname%-compatible-bin}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64-compatible.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
sha256sums_x86_64=('e04bdae0deb05c47158a805e2cba1ea25c9a3e409280c82bb062c4bc52a285cb')
install=bettbox.install

prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-compatible-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-compatible-bin}/g
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

    # Polkit rule for resolvectl command; the upstream deb carries it at
    # usr/share/polkit-1/rules.d/, so the package ships that exact file.
    install -Dm644 "${srcdir}/usr/share/polkit-1/rules.d/90-bettbox.rules" \
        "${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"
}
