# Maintainer: emersion <contact@emersion.fr>

pkgname=openvpn-protonvpn
pkgver=20170520
pkgrel=2
pkgdesc="OpenVPN configuration files and helper for protonvpn.com"
arch=(any)
url="https://protonvpn.com/"
license=('MIT')
depends=('openvpn')
optdepends=()
makedepends=('unzip' 'coreutils')
provides=('protonvpn')
source=("${pkgname}-${pkgver}.zip::https://protonvpn.com/download/ProtonVPN_config.zip")
noextract=(zip)
sha256sums=('f2e1829101f57e0ff900e5c36b22dae8915d8fbacd798d7bba3bfb85dde489fc')

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
