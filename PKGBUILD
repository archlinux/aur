# ~/Documents/git/forticlient-vpn/PKGBUILD 20 Mar at 02:01:36 PM
# Maintainer: Inknyto <mbaye.sene.etu@esmt.sn>
# Contributor: Meowser <edward.o.holmes@gmail.com>
# Contributor: Douglas Iuri Medeiros Cabral <douglasimcabral@zohomail.com>
pkgname=forticlient-vpn
pkgver=7.4.3.1736
pkgrel=2
pkgdesc="FortiClient VPN only build from the official Fortinet package"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('custom:fortinet')
depends=(
    'alsa-lib'
    'gnome-keyring'
    'gtk3'
    'gzip'
    'iptables'
    'libappindicator-gtk3'
    'libnotify'
    'libsecret'
    'libxss'
    'net-tools'
    'nss'
    'openssl'
    'polkit'
    'systemd'
)
optdepends=(
    'gtk2: legacy tray icon support'
    'libappindicator-gtk2: legacy tray icon support'
    'mate-polkit: polkit authentication for MATE'
    'polkit-gnome: polkit authentication for GNOME'
    'polkit-kde-agent: polkit authentication for KDE'
    'deepin-polkit-agent: polkit authentication for Deepin'
    'pantheon-polkit-agent: polkit authentication for Pantheon'
    'lxqt-policykit: polkit authentication for LXQt'
)
provides=('fortivpn' 'FortiClient')
conflicts=('forticlient')
install='forticlient-vpn.install'
source=("forticlient_vpn_${pkgver}_amd64.deb::https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
sha256sums=('45c465ca669d4bc6d0f1d3a93f4eb765b996e05c10f6e8e9e2db2fa6728a541c')
b2sums=('8de2baf93b121ea0b3810ce26482a86e67213637cd9cccb9ad14823825cda25bc805307caba83d1b59db93972a6f6bcfe5a073a56a06bb64d67f3b954685f632') 

prepare() {
    cd "$srcdir"
    bsdtar -xf "forticlient_vpn_${pkgver}_amd64.deb"
}

package() {
    cd "$srcdir"

    if [ -f data.tar.zst ]; then
        bsdtar -xf data.tar.zst -C "$pkgdir/"
    else
        bsdtar -xf data.tar.xz -C "$pkgdir/"
    fi

    install -Dm644 "${pkgdir}/lib/systemd/system/forticlient.service" \
        "${pkgdir}/usr/lib/systemd/system/forticlient.service"
    mkdir -p "${pkgdir}/var/lib/forticlient"
    rm -rf "${pkgdir}/lib"

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/forticlient/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Symbolic link to fortivpn CLI
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"
}
