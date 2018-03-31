# Author and maintainer: jbarnett (aur AT wbarnett DOT us)
# See https://nordvpn.com/tutorials/linux/openvpn/
pkgname=nordvpn
pkgver=2018.03.30.09.23.13
pkgrel=1
pkgdesc="NordVPN OpenVPN configuration files for use with openvpn-client@.service"
url="https://www.nordvpn.com"
arch=('x86_64')
license=('none')
depends=('openvpn')
install=${pkgname}.install
# Change these options since they don't apply to this package and slow
# down packaging, especially strip
options=('!strip' 'libtool' 'staticlibs' '!zipman' '!purge')
source=(https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
        README)
sha512sums=('56f5fe2cf0fb1e666756549cdf56991af793714266613f9e5d56ca4d1ddc8f352fe5482c3e1b2d4b299f91e98c6f5fec5f32ab5d3da6e366a7b1e78c65a7aa6c'
            '8154cef01e9183e7877b4794aa1db71dd537113d2441e6a51f67ed4c0d0ecb0564ef732f32ae48b1dabb52f7be8df5ecfcbb0b68ca5fc8e7896c653c4c2e5977')

# Updates the package version based on the last time the source was
# modified
pkgver() {
    date -d"$(curl --head --silent ${source[0]} | awk '/last-modified/ {print $3 $4 $5" "$6}')" +%Y.%m.%d.%H.%M.%S
}

# Rename to .conf extension to make compatible with
# openvpn-client@.service; additionally point openvpn to read username
# from configuration file
prepare() {
    cd $srcdir
    rename .ovpn .conf ovpn_*/*.ovpn
    sed -i 's$auth-user-pass$auth-user-pass /etc/nordvpn.conf$g' ovpn_*/*.conf
}

package() {
    cd $srcdir
    install -m644 README -Dt $pkgdir/usr/share/doc/${pkgname}/
    install -m644 ovpn_{udp,tcp}/*.conf -Dt $pkgdir/etc/openvpn/client/
}
