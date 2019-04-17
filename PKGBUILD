pkgname=miniupnpd-nft-git
pkgver=2.1.r109.g41f5475
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon with nftables support"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('glibc' 'iptables' 'net-tools' 'util-linux' 'sh' 'libnftnl')
makedepends=('git' 'lsb-release' 'procps-ng')
provides=('miniupnpd')
conflicts=('miniupnpd')
backup=(etc/miniupnpd/miniupnpd.conf)
source=("git+https://github.com/miniupnp/miniupnp.git"
        "miniupnpd.service")
sha256sums=('SKIP'
            '661bc58cce292571b69d46373325ebde89c503ad96aa92e8f5b13d1168e998cb')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/^miniupnpc_//;s/^miniupnpd_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "miniupnp/miniupnpd"

  make -f Makefile.linux_nft
}

package() {
  cd "miniupnp/miniupnpd"

  make DESTDIR="$pkgdir" SBININSTALLDIR="/usr/bin" -f Makefile.linux_nft install

  rm -r "$pkgdir/etc/init.d"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/miniupnpd/LICENSE"
  install -Dm644 "$srcdir/miniupnpd.service" "$pkgdir/usr/lib/systemd/system/miniupnpd.service"
  install -Dm755 "netfilter_nft/scripts/nft_init.sh" "$pkgdir/etc/miniupnpd/nft_init.sh"
  install -Dm755 "netfilter_nft/scripts/nft_flush.sh" "$pkgdir/etc/miniupnpd/nft_flush.sh"
  install -Dm755 "netfilter_nft/scripts/nft_delete_chain.sh" "$pkgdir/etc/miniupnpd/nft_delete_chain.sh"
  install -Dm755 "netfilter_nft/scripts/nft_removeall.sh" "$pkgdir/etc/miniupnpd/nft_removeall.sh"

  sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
             s/make genuuid/uuidgen/" "$pkgdir/etc/miniupnpd/miniupnpd.conf"
}
