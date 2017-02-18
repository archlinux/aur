# Maintainer: Nicolas Stinus <nicolas.stinus@gmail.com>

pkgname=openvpn-nordvpn
pkgver=17.2.14
pkgrel=3
pkgdesc="OpenVPN configuration files and helper for nordvpn.com"
arch=(any)
url="http://www.nordvpn.com"
license=('MIT')
depends=('openvpn' 'systemd')
optdepends=('iputils: run ping and rank functions')
makedepends=('unzip' 'coreutils')
provides=('nordvpn')
source=('https://nordvpn.com/api/files/zip')
noextract=(zip)
sha256sums=('1738320b3eb1f0fdf4bf144e5e34af248d1163c089147367263af04b3562328e')
install=${pkgname}.install

prepare() {
    mkdir conf
    unzip -q zip -d conf
}

build() {
    for f in $(find conf -name '*udp1194.ovpn'); do
        sed 's/^auth-user-pass.*$/auth-user-pass \/etc\/openvpn\/client\/nordvpn\/credentials.conf/g' -i $f
    done
}

package() {
    for f in $(find conf -type f -name '*udp1194.ovpn'); do
        install -D -m 444 $f $pkgdir/etc/openvpn/client/nordvpn/$(basename $f)
        ln -s /etc/openvpn/client/nordvpn/$(basename $f) $pkgdir/etc/openvpn/client/nordvpn_$(echo $(basename $f) | cut -d '.' -f 1).conf
    done
    chmod 750 $pkgdir/etc/openvpn/client
    install -D -m 755 ../nordvpn $pkgdir/usr/bin/nordvpn
}
