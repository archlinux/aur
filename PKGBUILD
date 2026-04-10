# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=miniupnpd-git
pkgver=2.3.10.r16.gf83b5e2
pkgrel=1
pkgdesc="Lightweight UPnP IGD daemon (git)"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD-3-Clause')
depends=('glibc' 'iptables' 'libcap-ng.so' 'libnetfilter_conntrack' 'util-linux-libs')
makedepends=('git' 'lsb-release' 'libcap-ng' 'procps-ng' 'util-linux')
provides=("miniupnpd=$pkgver")
conflicts=('miniupnpd')
backup=('etc/miniupnpd/miniupnpd.conf')
source=("git+https://github.com/miniupnp/miniupnp.git"
        "miniupnpd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/miniupnpd/-/raw/main/miniupnpd.service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "miniupnp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^miniupnpd_[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^miniupnpd_//;s/_/./g'
}

build() {
  cd "miniupnp/miniupnpd"

  ./configure \
    --firewall=iptables \
    --igd2 \
    --ipv6 \
    --leasefile \
    --vendorcfg
  make
}

package() {
  cd "miniupnp/miniupnpd"

  make \
    DESTDIR="$pkgdir" \
    SBINDIR="/usr/bin" \
    install

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/miniupnpd"
  install -Dm644 "$srcdir/miniupnpd.service" -t "$pkgdir/usr/lib/systemd/system"

  sed -i 's:/s\?bin/iptables:/usr/bin/iptables:
          s:eth0:"`cat /etc/miniupnpd/miniupnpd.conf | '"awk -F= '/^ext_ifname/ { print \$2 }'"'`":' "$pkgdir/etc/miniupnpd"/*.sh
  sed -i -e "s/^uuid=[-0-9a-f]*/uuid=00000000-0000-0000-0000-000000000000/
             s/make genuuid/uuidgen/" "$pkgdir/etc/miniupnpd/miniupnpd.conf"

  rm -r "$pkgdir/etc/init.d"
}
