# Maintainer: Wes Barnett (aur AT wbarnett DOT us)
pkgname=nordvpn
pkgver=2018.03.30.09.23.13
pkgrel=1
pkgdesc="NordVPN OpenVPN configuration files for use with openvpn-client@.service"
url="https://www.nordvpn.com"
install=${pkgname}.install
source=(https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip README)
md5sums=('SKIP' '1667c77fbd5f9e6ebad742c352d4592a')
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
