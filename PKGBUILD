# Maintainer: Joaquin Wojcik <wojcikjoaquin@gmail.com>
pkgname=netinfo-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal UI for network interfaces: negotiated link speed, addresses, throughput and per-interface reachability"
arch=('any')
url="https://github.com/joaquinwojcik/netinfo-tui"
license=('MIT')
depends=('bash' 'coreutils' 'iproute2' 'sed' 'gawk')
optdepends=(
  'iputils: ICMP probes for the PING column'
  'docker: resolve br-<id> bridges to their docker network name'
  'iw: show the associated SSID as a wifi interface name'
  'systemd: udev hardware model names and per-link DNS in the detail pane'
  'ncurses: terminal size detection via tput'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('98bb99d0e114d6c49f197eca6bae356eec19ae40119e56017b82d1cd38a9a28b')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  bash -n bin/netinfo
  # The geometry test needs a pty; skip it in clean chroots without util-linux.
  command -v script >/dev/null && tests/geometry.sh || true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/netinfo "$pkgdir/usr/bin/netinfo"
  install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md   "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/aliases "$pkgdir/usr/share/doc/$pkgname/examples/aliases"
  install -Dm644 examples/probes  "$pkgdir/usr/share/doc/$pkgname/examples/probes"
}
