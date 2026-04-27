# Maintainer:
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop
pkgver=5.12.3
pkgrel=1
pkgdesc='Zulip Desktop Client for Linux'
arch=('x86_64')
url='https://zulip.com'
license=('Apache-2.0')
_electron=electron39
depends=('bash' "${_electron}" 'glibc')
makedepends=('gendesk' 'pnpm' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zulip/zulip-desktop/archive/v${pkgver}.tar.gz")
sha512sums=('3fbcd2452ceb194b3ac6ca77e63ed09ee2287196e76f7bb4a1ed311cd15b3df151ff3649bd6d5f04b9361e8548dd8b7dbd1db618a3b7645af9b66d659f3ea9c6')

prepare() {
    cd "${pkgname}-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "Zulip" \
        --categories "Chat;GNOME;GTK;Network;InstantMessaging" \
        --custom "StartupWMClass=Zulip"

    cat >"${pkgname}.sh" <<EOF
#!/usr/bin/bash
exec ${_electron} /usr/lib/${pkgname}/app.asar "\$@"
EOF
}

build() {
    cd "${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    pnpm install --frozen-lockfile
    node --run pack -- \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 build/zulip.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
