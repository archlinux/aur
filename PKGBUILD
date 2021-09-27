# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=linux-wifi-hotspot
pkgver=4.1.0
pkgrel=2
pkgdesc="Feature-rich wifi hotspot creator"
arch=('x86_64' 'aarch64')
url="https://github.com/lakinduakash/linux-wifi-hotspot"
license=('BSD')
depends=('hostapd' 'iw' 'gtk3' 'procps-ng' 'dnsmasq' 'iproute2')
optdepends=('haveged: For random MAC generation'
            'wireless_tools: if iw cannot recognize your adapter'
            'bash-completion: for bash completions')
provides=('wihotspot' 'create_ap')
conflicts=('wihotspot' 'create_ap')
backup=('etc/create_ap.conf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7deb1aab2545cd1c2a311e678d3c07778688e29fbf53b4f434563a64532e4c25')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/sudo/wheel/g' src/scripts/policies/polkit.rules
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Fix permissions
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
