pkgname=miniupnpd-nft-git
pkgver=2.3.9.r64.g51ba388
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon with nftables support"
arch=('i686' 'x86_64')
url="https://miniupnp.tuxfamily.org"
license=('BSD')
depends=('glibc' 'iptables' 'net-tools' 'util-linux' 'sh' 'libnftnl')
makedepends=('git' 'lsb-release' 'procps-ng' 'util-linux' 'sed')
provides=('miniupnpd')
conflicts=('miniupnpd')
backup=(etc/miniupnpd/miniupnpd.conf)
source=("git+https://github.com/miniupnp/miniupnp.git")
sha256sums=('SKIP')

pkgver() {
  cd "miniupnp"
  git describe --long --tags --match 'miniupnpd*' | sed 's/^miniupnpd_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "miniupnp/miniupnpd"
  ./configure \
    --ipv6 \
    --leasefile \
    --vendorcfg \
    --disable-fork \
    --systemd \
    --firewall=nftables
  make
}

package() {
  cd "miniupnp/miniupnpd"

  make DESTDIR="$pkgdir" SBINDIR="/usr/bin" install

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/miniupnpd/LICENSE"
  install -Dm755 "netfilter_nft/scripts/miniupnpd_functions.sh" "$pkgdir/etc/miniupnpd/miniupnpd_functions.sh"
  install -Dm755 "netfilter_nft/scripts/nft_display.sh" "$pkgdir/etc/miniupnpd/nft_display.sh"
}
