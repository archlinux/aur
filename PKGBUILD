# Maintainer: emersion <contact@emersion.fr>

pkgname=openvpn-protonvpn
pkgver=0.1
pkgrel=1
pkgdesc="OpenVPN configuration files and helper for protonvpn.com"
arch=(any)
url="https://protonvpn.com/"
license=('MIT')
depends=('openvpn' 'systemd')
optdepends=()
makedepends=('unzip' 'coreutils')
provides=('protonvpn')
source=('https://protonvpn.com/download/ProtonVPN_config.zip')
noextract=(zip)
sha256sums=('0ba91f4da8b54833afd9bd69204afb0075cdb170afa88947e4d55be4e090eb84')

prepare() {
    test -d conf && rm -rf conf
    mkdir conf
    unzip -q ProtonVPN_config.zip -d conf
}

package() {
    for f in $(find conf -type f -name '*.ovpn'); do
        install -D -m 444 $f $pkgdir/etc/openvpn/client/protonvpn/$(basename $f)
    done
    for f in $(find conf -type f -name '*udp1194.ovpn'); do
        ln -s /etc/openvpn/client/protonvpn/$(basename $f) $pkgdir/etc/openvpn/client/protonvpn_$(echo $(basename $f) | cut -d '.' -f 1).conf
    done
    chmod 750 $pkgdir/etc/openvpn/client
}
