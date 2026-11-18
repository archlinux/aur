# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-compatible-bin
_pkgname=Bettbox
pkgver=1.19.8
pkgrel=4
pkgdesc="A cross-platform network traffic routing and DNS debugging tool, deeply built on the powerful Mihomo core. (Build with GOAMD64=v1)"
arch=('x86_64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
conflicts=(
	'bettbox' 'bettbox-bin' 'bettbox-compatible' 'bettbox-compatible-pre'
	'bettbox-compatible-pre-bin' 'bettbox-lite' 'bettbox-lite-bin'
	'bettbox-lite-compatible' 'bettbox-lite-compatible-bin'
	'bettbox-lite-compatible-pre' 'bettbox-lite-compatible-pre-bin'
	'bettbox-lite-pre' 'bettbox-lite-pre-bin' 'bettbox-pre' 'bettbox-pre-bin'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook" "bettbox.install")
# The cache name carries the full pkgname: every package in a CI run shares one
# SRCDEST, and makepkg reuses a cached file by name without validating it, so
# two packages asking for one name (this one and bettbox-pre-bin both asked for
# bettbox-<ver>-x86_64.deb) make updpkgsums publish the other's checksum.
source_x86_64=(
    "${pkgname}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64-compatible.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
sha256sums_x86_64=('2d3ce9a41f3b5fa8eefa58eba5ae004902cc82a2f24b664da32b76bf07ef38a4')
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
