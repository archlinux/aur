# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpd-git
pkgver=r60.ge7068a7
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
backup=(etc/miniupnpd/miniupnpd.conf)
depends=('iptables' 'net-tools' 'util-linux')
makedepends=('git' 'lsb-release')
source=("git+https://github.com/miniupnp/miniupnp.git"
        miniupnpd.systemd)
sha256sums=('SKIP'
            '66cd1ed0ae55c683910d46c2e486a8b52e48088b70248323cf894bc962ede48f')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/[^-]*-\(.*\)/r\1/;s/-/./g'
}

build() {
  cd "miniupnp/miniupnpd"

  CONFIG_OPTIONS="--ipv6 --leasefile" make -f Makefile.linux config.h
  make -f Makefile.linux
}

package() {
  cd "miniupnp/miniupnpd"

  make PREFIX="$pkgdir" SBININSTALLDIR="$pkgdir/usr/bin" -f Makefile.linux install

  rm -r "$pkgdir/etc/init.d"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/miniupnpd.systemd" "$pkgdir/usr/lib/systemd/system/miniupnpd.service"

  sed -i 's:/s\?bin/iptables:/usr/bin/iptables:
          s:eth0:"`cat /etc/miniupnpd/miniupnpd.conf | '"awk -F= '/^ext_ifname/ { print \$2 }'"'`":' "${pkgdir}"/etc/miniupnpd/*.sh
  sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
             s/make genuuid/uuidgen/" "${pkgdir}/etc/miniupnpd/miniupnpd.conf"
}
