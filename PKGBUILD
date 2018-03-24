# Author and maintainer: jbarnett (aur AT wbarnett DOT us)
pkgname=nordvpn
pkgver=2018.03.23.10.26.57
pkgrel=1
pkgdesc="NordVPN OpenVPN configuration files"
url="https://www.nordvpn.com"
arch=('x86_64')
license=('none')
depends=('openvpn')
install=${pkgname}.install
# See https://nordvpn.com/tutorials/linux/openvpn/
source=(https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
        README)
sha512sums=('abbe9d39cb1615f23cdfbeb2cc5ffa493b6017616378e73b84bd141e0d802a548930b3a0e30c79c33818c9e4a7e81d18ef86ed133199d19bf0ac0a62d8c8e36d'
            'b9a9d754f269f42695016402beddc3e7325e4ded15165cf45ca0c091482312360701c191bca0307fae5c677d567dc1ad0229bd9854507b09fc63d1f35b6b140f')

pkgver() {
    # Updates the package version based on the last time the source
    # was modified
    mydate=$(curl --head --silent ${source[0]} | awk '/last-modified/ {print $3 $4 $5" "$6}')
    date -d"$mydate" +%Y.%m.%d.%H.%M.%S
}

prepare() {
    cd $srcdir
    for d in ovpn_{udp,tcp}; do
        cd $d
        # Renames the .ovpn extension to .conf for compatibility with
        # the systemd unit
        for i in *.ovpn; do 
            mv "$i" "$(echo $i | sed -e 's/ovpn/conf/')"
        done
        # Adds a line to each configuration such that it will read the
        # username and password from /etc/nordvpn.conf
        sed -i -e 's$auth-user-pass$auth-user-pass /etc/nordvpn.conf$g' *.conf
        cd ..
    done
}

package() {
    cd $srcdir
    mkdir -p -m750 $pkgdir/etc/openvpn/client
    mkdir -p -m755 $pkgdir/usr/share/doc/${pkgname}
    install -m644 README -t $pkgdir/usr/share/doc/${pkgname}/
    install -m644 ovpn_{udp,tcp}/*.conf -t $pkgdir/etc/openvpn/client/
}
