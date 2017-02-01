# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=17.2.1
pkgrel=1
epoch=
pkgdesc="OpenVPN configuration files and helper for nordvpn.com"
arch=(any)
url=""
license=('MIT')
groups=()
depends=('openvpn' 'systemd')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://nordvpn.com/api/files/zip')
noextract=(zip)
sha256sums=('d2ab555e0c601a4b220339fa84e35909aab59451bd115b795cdb76b552991810')
install=${pkgname}.install

prepare() {
    mkdir conf
    unzip -q zip -d conf
}

build() {
    find conf -name '*.ovpn' | parallel sed \'s/^auth-user-pass.*$/auth-user-pass \\/etc\\/openvpn\\/client\\/nordvpn\\/credentials.conf/g\' -i {}
}

package() {
    mkdir -p $pkgdir/etc/openvpn/client/nordvpn
    chmod -R 750 $pkgdir/etc/openvpn/client
    for f in $(find conf -type f -name '*udp1194.ovpn'); do
        install -m 444 $f $pkgdir/etc/openvpn/client/nordvpn
        ln -s /etc/openvpn/client/nordvpn/$(basename $f) $pkgdir/etc/openvpn/client/nordvpn_$(echo $(basename $f) | cut -d '.' -f 1).conf
    done
    mkdir -p $pkgdir/usr/bin
    install -m 755 ../nordvpn $pkgdir/usr/bin
}
