# Maintainer: emersion <contact@emersion.fr>

pkgname=openvpn-protonvpn
pkgver=0.1
pkgrel=2
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
