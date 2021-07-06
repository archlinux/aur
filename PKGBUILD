# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpd-git
pkgver=2.2.2.r15.g6f848ae
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('glibc' 'iptables' 'net-tools' 'util-linux' 'sh')
makedepends=('git' 'lsb-release' 'procps-ng')
provides=('miniupnpd')
conflicts=('miniupnpd')
backup=('etc/miniupnpd/miniupnpd.conf')
source=("git+https://github.com/miniupnp/miniupnp.git"
        "miniupnpd.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/miniupnpd/trunk/miniupnpd.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/^miniupnpc_//;s/^miniupnpd_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "miniupnp/miniupnpd"

  ./configure \
    --ipv6 \
    --leasefile
  make
}

package() {
  cd "miniupnp/miniupnpd"

  make \
    DESTDIR="$pkgdir" \
    SBININSTALLDIR="/usr/bin" \
    install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/miniupnpd"
  install -Dm644 "$srcdir/miniupnpd.service" -t "$pkgdir/usr/lib/systemd/system"

  sed -i 's:/s\?bin/iptables:/usr/bin/iptables:
          s:eth0:"`cat /etc/miniupnpd/miniupnpd.conf | '"awk -F= '/^ext_ifname/ { print \$2 }'"'`":' "$pkgdir/etc/miniupnpd"/*.sh
  sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
             s/make genuuid/uuidgen/" "$pkgdir/etc/miniupnpd/miniupnpd.conf"

  rm -r "$pkgdir/etc/init.d"
}
