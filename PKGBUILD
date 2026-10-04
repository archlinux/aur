# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ppp-git
pkgver=2.5.4.r6.g13ba8a5
pkgrel=1
pkgdesc="A package which implements the Point-to-Point Protocol"
arch=('i686' 'x86_64')
url="https://ppp.samba.org/"
license=('BSD-3-Clause' 'GPL-2.0-or-later')
depends=('glibc' 'libpcap' 'libxcrypt' 'openssl' 'pam' 'systemd-libs')
makedepends=('git')
provides=("ppp=$pkgver")
conflicts=('ppp')
backup=(etc/ppp/{ip-down,ip-down.d/00-dns.sh,ip-up,ip-up.d/00-dns.sh,ipv6-down,ipv6-up,ipv6-up.d/00-iface-config.sh,options})
source=("git+https://github.com/paulusmack/ppp.git"
        "ip-down::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ip-down"
        "ip-down.d.dns.sh::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ip-down.d.dns.sh"
        "ip-up::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ip-up"
        "ip-up.d.dns.sh::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ip-up.d.dns.sh"
        "ipv6-down::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ipv6-down"
        "ipv6-up::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ipv6-up"
        "ipv6-up.d.iface-config.sh::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ipv6-up.d.iface-config.sh"
        "options::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/options"
        "ppp.systemd::https://gitlab.archlinux.org/archlinux/packaging/packages/ppp/-/raw/main/ppp.systemd")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "ppp"

  sed -i --follow-symlinks 's/noipx/#noipx/' "$srcdir/options"
}

pkgver() {
  cd "ppp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ppp"

  ./autogen.sh \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --enable-cbcp \
    --enable-multilink \
    --enable-systemd
  make
}

package() {
  cd "ppp"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/options" -t "$pkgdir/etc/ppp"
  install -Dm755 "$srcdir"/{ip,ipv6}-{down,up} -t "$pkgdir/etc/ppp"

  install -Dm755 "$srcdir/ip-up.d.dns.sh" "$pkgdir/etc/ppp/ip-up.d/00-dns.sh"
  install -Dm755 "$srcdir/ip-down.d.dns.sh" "$pkgdir/etc/ppp/ip-down.d/00-dns.sh"

  install -Dm755 "$srcdir/ipv6-up.d.iface-config.sh" "$pkgdir/etc/ppp/ipv6-up.d/00-iface-config.sh"
  install -dm755 "$pkgdir/etc/ppp/ipv6-down.d"

  install -dm700 "$pkgdir/etc/ppp/peers"

  install -Dm755 "scripts"/{lcp_rtt_dump,lcp_rtt_exporter,plog,poff,pon} -t "$pkgdir/usr/bin"
  install -Dm644 "scripts/pon.1" -t "$pkgdir/usr/share/man/man1"

  install -Dm644 "$srcdir/ppp.systemd" "$pkgdir/usr/lib/systemd/system/ppp@.service"

  install -Dm644 "LICENSE.BSD" -t "$pkgdir/usr/share/licenses/ppp"
}
