pkgname=miniupnpd-nft-git
pkgver=2.3.0.r1.g9df2f43
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
source=("git+https://github.com/miniupnp/miniupnp.git"
        "miniupnpd.service")
sha256sums=('SKIP'
            '845688ea3f7b0fd2fc0ed68f36a6a26af80bc8974828478d109155ce0889f409')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/^miniupnpc_//;s/^miniupnpd_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "miniupnp/miniupnpd"
  ./configure --ipv6 --leasefile --disable-fork --firewall=nftables
  make
}

package() {
  cd "miniupnp/miniupnpd"

  make DESTDIR="$pkgdir" SBININSTALLDIR="/usr/bin" install

  rm -r "$pkgdir/etc/init.d"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/miniupnpd/LICENSE"
  install -Dm644 "$srcdir/miniupnpd.service" "$pkgdir/usr/lib/systemd/system/miniupnpd.service"
  install -Dm755 "netfilter_nft/scripts/miniupnpd_functions.sh" "$pkgdir/etc/miniupnpd/miniupnpd_functions.sh"
  install -Dm755 "netfilter_nft/scripts/nft_init.sh" "$pkgdir/etc/miniupnpd/nft_init.sh"
  install -Dm755 "netfilter_nft/scripts/nft_flush.sh" "$pkgdir/etc/miniupnpd/nft_flush.sh"
  install -Dm755 "netfilter_nft/scripts/nft_delete_chain.sh" "$pkgdir/etc/miniupnpd/nft_delete_chain.sh"
  install -Dm755 "netfilter_nft/scripts/nft_removeall.sh" "$pkgdir/etc/miniupnpd/nft_removeall.sh"
  install -Dm755 "netfilter_nft/scripts/nft_display.sh" "$pkgdir/etc/miniupnpd/nft_display.sh"

  sed -i -e "s/^uuid=0\{8\}\(-0000\)\{3\}-0\{12\}$/uuid=`uuidgen`/g" "$pkgdir/etc/miniupnpd/miniupnpd.conf"
}
