# Maintainer: Ashintosh <ash[at]ashinto[dot]sh>

pkgname=squawker-vpn-bin
pkgver=1.0.0
pkgrel=2
pkgdesc='TryHackMe Squawker VPN Client'
arch=('x86_64' 'aarch64')
url='https://tryhackme.com'
license=('custom')

options=('!strip')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'libappindicator'
)

provides=('squawker-vpn')
conflicts=('squawker-vpn')

source_x86_64=("${pkgname}-${pkgver}.deb"::https://squawker-vpn.vm.tryhackme.com/latest/squawker-vpn_${pkgver}_amd64.deb)
sha256sums_x86_64=('38a00ceac379b2cbfbc87bd103d96ee8214fc3b5a7dc52210e28af13deab188c')

source_aarch64=("${pkgname}-${pkgver}.deb"::https://squawker-vpn.vm.tryhackme.com/latest/squawker-vpn_${pkgver}_arm64.deb)
sha256sums_aarch64=('32494cfae221503912f9222a447e49e93fe272c2269a3e7ad9af58016a1c21a3')

install="${pkgname}.install"

prepare() {
    cd "${srcdir}"
    ar x "${pkgname}-${pkgver}.deb"

    if [[ ! -f 'data.tar.gz' ]]; then
        error 'data.tar not found after extraction'
        return 1
    fi
}

package() {
    set -e

    cd "${srcdir}"
    bsdtar -xf 'data.tar.gz' -C "${pkgdir}"

    if [[ -d "${pkgdir}/lib" ]]; then
        install -d "${pkgdir}/usr"
        mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
    fi

    if [[ -d "${pkgdir}/lib/systemd" ]]; then
        install -d "${pkgdir}/usr/lib/systemd"
        cp -a "${pkgdir}/lib/systemd/." "${pkgdir}/usr/lib/systemd/"
        rm -rf "${pkgdir}/lib/systemd"
    fi
}