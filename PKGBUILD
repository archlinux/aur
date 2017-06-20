# Maintainer: emersion <contact@emersion.fr>

pkgname=openvpn-protonvpn
pkgver=20170620
pkgrel=1
pkgdesc="OpenVPN configuration files and helper for protonvpn.com"
arch=(any)
url="https://protonvpn.com/"
license=('MIT')
depends=('openvpn')
optdepends=()
makedepends=('unzip' 'coreutils')
provides=('protonvpn')
source=("${pkgname}-${pkgver}.zip::https://account.protonvpn.com/api/vpn/config?Category=Server&Platform=Linux&Protocol=udp&Tier=2")
noextract=(zip)
sha256sums=('SKIP') # ZIP is auto-generated, cannot use a checksum

prepare() {
    test -d conf && rm -rf conf
    mkdir conf
    unzip -q "${pkgname}-${pkgver}.zip" -d conf
}

package() {
    # Generate TCP config files
    for f in $(find conf -type f -name '*udp1194.ovpn'); do
        basename=$(echo $(basename $f) | sed -e s/udp1194/tcp443/)
        sed -e 's/proto udp/proto tcp/' -E -e 's/remote ([^ ]+) 1194/remote \1 443/' $f > conf/$basename
    done
    for f in $(find conf -type f -name '*.ovpn'); do
        id=$(echo $(basename $f) | cut -d '.' -f 1,4)
        install -D -m 644 $f $pkgdir/etc/openvpn/client/protonvpn.${id}.conf
    done
    chmod 755 $pkgdir/etc/openvpn/client
}
