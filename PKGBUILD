# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpd-iptables-legacy
pkgver=2.3.11
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon (iptables-legacy backend)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD-3-Clause')
depends=('glibc' 'iptables' 'libcap-ng.so' 'libnetfilter_conntrack' 'util-linux-libs')
makedepends=('git' 'lsb-release' 'libcap-ng' 'procps-ng' 'util-linux')
provides=("miniupnpd=$pkgver")
conflicts=('miniupnpd')
backup=('etc/miniupnpd/miniupnpd.conf')
source=("miniupnpd-$pkgver-src.tar.gz::https://github.com/miniupnp/miniupnp/releases/download/miniupnpd_${pkgver//./_}/miniupnpd-$pkgver.tar.gz"
        "miniupnpd-$pkgver-src.tar.gz.sig::https://github.com/miniupnp/miniupnp/releases/download/miniupnpd_${pkgver//./_}/miniupnpd-$pkgver.tar.gz.sig")
sha256sums=('91994b127da735b2c97f19992e34420648c0e8c4ace8a4bcb0596e7685c48678'
            'SKIP')
validpgpkeys=('751E9FF6944A3B36A5432216DB511043A31ACAAF')  # miniupnp <miniupnp@free.fr>


build() {
  cd "miniupnpd-$pkgver"

  ./configure \
    --disable-tests \
    --firewall=iptables \
    --iptablespath=/usr/bin/iptables-legacy \
    --igd2 \
    --ipv6 \
    --leasefile \
    --vendorcfg
  make
}

package() {
  cd "miniupnpd-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    SBINDIR="/usr/bin" \
    install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/miniupnpd"
  install -Dm644 "linux/miniupnpd.iptables.service" "$pkgdir/usr/lib/systemd/system/miniupnpd.service"

  sed -i 's/iptables/iptables-legacy/;s/ip6tables/ip6tables-legacy/' "$pkgdir/etc/miniupnpd/miniupnpd_functions.sh"
  sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
             s/make genuuid/uuidgen/" "$pkgdir/etc/miniupnpd/miniupnpd.conf"

  rm -r "$pkgdir/etc/init.d"
}
