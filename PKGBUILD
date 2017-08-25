# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpd-git
pkgver=2.0.r121.g587f33c
pkgrel=2
pkgdesc="Lightweight UPnP IGD daemon (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('glibc' 'iptables' 'net-tools' 'util-linux' 'sh')
makedepends=('git' 'lsb-release')
provides=('miniupnpd')
conflicts=('miniupnpd')
backup=(etc/miniupnpd/miniupnpd.conf)
source=("git+https://github.com/miniupnp/miniupnp.git"
        "miniupnpd.systemd::https://git.archlinux.org/svntogit/community.git/plain/trunk/miniupnpd.systemd?h=packages/miniupnpd")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "miniupnp"

  git describe --long --tags | sed 's/^miniupnpc_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "miniupnp/miniupnpd"

  CONFIG_OPTIONS="--ipv6 --leasefile" make -f Makefile.linux config.h
  make -f Makefile.linux
}

package() {
  cd "miniupnp/miniupnpd"

  make DESTDIR="$pkgdir" SBININSTALLDIR="/usr/bin" -f Makefile.linux install

  rm -r "$pkgdir/etc/init.d"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/miniupnpd/LICENSE"
  install -Dm644 "$srcdir/miniupnpd.systemd" "$pkgdir/usr/lib/systemd/system/miniupnpd.service"

  sed -i 's:/s\?bin/iptables:/usr/bin/iptables:
          s:eth0:"`cat /etc/miniupnpd/miniupnpd.conf | '"awk -F= '/^ext_ifname/ { print \$2 }'"'`":' "$pkgdir/etc/miniupnpd"/*.sh
  sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
             s/make genuuid/uuidgen/" "$pkgdir/etc/miniupnpd/miniupnpd.conf"
}
