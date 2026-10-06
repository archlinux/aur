# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-pre-bin
_pkgname=Bettbox
pkgver=1.19.5pre1
pkgrel=1
_pkgver="${pkgver/pre/-pre}"
pkgdesc="A multi-platform proxy client powered by the Mihomo (Clash Meta) core, refactored based on early versions of FlClash."
arch=('x86_64' 'aarch64')
url="https://github.com/appshubcc/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=('bettbox' 'bettbox-compatible' 'bettbox-compatible-pre' 'bettbox-compatible-bin' 'bettbox-bin' 'bettbox-pre' 'bettbox-compatible-pre-bin')
provides=("${pkgname%-pre-bin}=${pkgver}")
depends=(
    'gtk3'
    'libayatana-appindicator'
    'libayatana-indicator'
    'libkeybinder3'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook" "99-bettbox.rules" "bettbox.install")
# Upstream names its debs by Debian architecture (amd64/arm64), which does not
# match the AUR architecture names, so both the cache name and the URL are
# spelled out per architecture. ${arch} cannot be used here: makepkg binds it
# to the *host* architecture while expanding per-arch arrays, so it would give
# both entries the same cache name.
source_x86_64=(
    "${pkgname%-pre-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver%-pre*}-linux-amd64.deb"
)
source_aarch64=(
    "${pkgname%-pre-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${_pkgver}/${_pkgname}-${_pkgver%-pre*}-linux-arm64.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'f1a21fce8675e6bd03565f56d21954e9c13991426bdc38368cd1b85f6893a593'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
sha256sums_x86_64=('eb8874f8ce99f03b00dbbe08411704c4ad73b0b825db2f715268abefc65f02bb')
sha256sums_aarch64=('0afde7f9677669ddd69161ec4a0986dbb6be34a1b54eed5d831deff7faf5a663')
install=bettbox.install

prepare() {
    bsdtar -xf "${srcdir}/data."*
    # Upstream already ships Categories=Network; (line 8), so only the missing
    # StartupWMClass is inserted, right before StartupNotify=true (line 10).
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-pre-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-pre-bin}/g
        10i\StartupWMClass=com.appshub.bettbox
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname%-pre-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-pre-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-pre-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-pre-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pre-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-pre-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-pre-bin}.png"

    install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

    # Polkit rule for resolvectl command
    install -Dm644 "${srcdir}/99-bettbox.rules" \
        "${pkgdir}/usr/share/polkit-1/rules.d/99-bettbox.rules"
}
