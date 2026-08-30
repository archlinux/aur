# Maintainer: James McMurray <jamesmcm03@gmail.com>

pkgname=vopono
pkgver=1.0.1
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections' 'libnatpmp: for ProtonVPN port forwarding support' 'trojan: for Trojan Wireguard forwarding support' 'redsocks: for SSH proxy forwarding support' 'openssh: for SSH proxy forwarding support')
install=vopono.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'vopono.service')
sha256sums=('e6560d8845e734f2252df1f4a774921e4dde55cccb852dd4bba6e37f032a036d'
            'fe558d14c1efa8c2bf638b5882fbf63c98970b76b661f1c8c50a72b6b5553e13')
provides=('vopono')
conflicts=('vopono')

build() {
  cd "$pkgname-$pkgver"
  
  CFLAGS+=" -ffat-lto-objects" cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/vopono.service" "${pkgdir}/usr/lib/systemd/system/vopono.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
