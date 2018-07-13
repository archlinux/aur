# Maintainer: Wes Barnett (aur AT wbarnett DOT us)
pkgname=nordvpn
pkgver=2018.07.12.08.57.30
pkgrel=1
pkgdesc="NordVPN OpenVPN configuration files for use with openvpn-client@.service"
url="https://www.nordvpn.com"
install=${pkgname}.install
source=(https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip README)
sha512sums=('SKIP'
            '8154cef01e9183e7877b4794aa1db71dd537113d2441e6a51f67ed4c0d0ecb0564ef732f32ae48b1dabb52f7be8df5ecfcbb0b68ca5fc8e7896c653c4c2e5977')
arch=('any')
depends=('openvpn')
options=('!strip')

pkgver() {
  date -d"$(curl --head --silent ${source[0]} | awk '/last-modified/ {print $3 $4 $5" "$6}')" +%Y.%m.%d.%H.%M.%S
}

prepare() {
  rename .ovpn .conf ovpn_*/*.ovpn
  sed -i 's$auth-user-pass$auth-user-pass /etc/nordvpn.conf$g' ovpn_*/*.conf
}

package() {
  install -m644 README -Dt $pkgdir/usr/share/doc/${pkgname}/
  install -m644 ovpn_{udp,tcp}/*.conf -Dt $pkgdir/etc/openvpn/client/
}
