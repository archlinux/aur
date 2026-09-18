# Maintainer:
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: AI5C <ai5c@ai5c.com>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop
pkgver=5.13.1
pkgrel=1
pkgdesc='Zulip Desktop Client for Linux'
arch=('x86_64')
url='https://zulip.com'
license=('Apache-2.0')
_electron=electron44
depends=('bash' "${_electron}" 'glibc')
makedepends=('gendesk' 'npm' 'pnpm' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zulip/zulip-desktop/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha512sums=('7bf5898ef6986374c71b618f1d729b0f694ef4e01ac26ab70e6025690ca23533df23e3e81343e19c3f2da573a8fd385d84a63aa76113518f3b7e26f5376debae'
            '32753894751dffd40781cd04435643573252494be4db3e542f7af90885d00317188bd65587287f5fbaa63b79fcfad33d98929e456e31e90b434e5cd59bbfbafb')

prepare() {
    cd "${pkgname}-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "Zulip" \
        --categories "Chat;GNOME;GTK;Network;InstantMessaging" \
        --custom "StartupWMClass=Zulip"
    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install --frozen-lockfile
    pnpm run build
    pnpm exec electron-builder --linux dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 build/zulip.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
