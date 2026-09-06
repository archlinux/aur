# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=linux-wifi-hotspot
pkgver=5.0.0
pkgrel=1
pkgdesc="Feature-rich wifi hotspot creator"
arch=('x86_64' 'aarch64')
url="https://github.com/lakinduakash/linux-wifi-hotspot"
license=('BSD-2-Clause')
depends=(
  'gtk3'
  'hostapd'
  'iproute2'
  'iw'
  'libpng'
  'polkit'
  'procps-ng'
  'qrencode'
  'util-linux'
  'which'
)
makdedepends=('desktop-file-utils')
optdepends=(
  "dnsmasq: For 'NATed' or 'None' Internet sharing method"
  "iptables: For 'NATed' or 'None' Internet sharing method"
  'haveged: For random MAC generation'
  'wireless_tools: Use iwconfig if iw cannot recognize your adapter'
)
provides=('create_ap')
conflicts=('create_ap')
backup=('etc/create_ap.conf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c4310e30c2a28f5c9d48d0387e4ebd5287ac528e7fdb1dd4c3811498945733d')

prepare() {
  cd "$pkgname-$pkgver"

  # Set Exec to GUI binary
  desktop-file-edit --set-key=Exec --set-value=wihotspot-gui \
    src/desktop/wifihotspot.desktop
}

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate src/desktop/wifihotspot.desktop
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Remove useless shell script that only runs wihotspot-gui
  rm -v "$pkgdir/usr/bin/wihotspot"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
