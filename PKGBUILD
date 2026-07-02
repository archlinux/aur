# Maintainer: Ashintosh <ash[at]ashinto[dot]sh>

pkgname=squawker-vpn-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='TryHackMe Squawker VPN Client'
arch=('x86_64')
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

source=("${pkgname}-${pkgver}.deb"::https://squawker-vpn.vm.tryhackme.com/latest/squawker-vpn_${pkgver}_amd64.deb)
sha256sums=('38a00ceac379b2cbfbc87bd103d96ee8214fc3b5a7dc52210e28af13deab188c')

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