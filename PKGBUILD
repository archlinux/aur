# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iptables-git
pkgver=1.8.11.r14.g192c3a6b
pkgrel=1
pkgdesc="Userspace command line program used to configure the packet filtering ruleset"
arch=('i686' 'x86_64')
url="https://www.netfilter.org/projects/iptables/index.html"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmnl' 'libnetfilter_conntrack' 'libnfnetlink' 'libnftnl' 'libpcap')
makedepends=('git' 'linux-api-headers')
provides=("arptables=$pkgver" "ebtables=$pkgver" "iptables=$pkgver" "iptables-nft=$pkgver" 'libip4tc.so' 'libip6tc.so' 'libipq.so' 'libxtables.so')
conflicts=('arptables' 'ebtables' 'iptables' 'iptables-nft')
backup=('etc/ethertypes'
        etc/iptables/{ip,ip6}tables.rules)
source=("git+https://git.netfilter.org/iptables"
        "arptables.service::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/arptables.service"
        "ebtables.service::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/ebtables.service"
        "empty-filter.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/empty-filter.rules"
        "empty-mangle.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/empty-mangle.rules"
        "empty-nat.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/empty-nat.rules"
        "empty-raw.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/empty-raw.rules"
        "empty-security.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/empty-security.rules"
        "empty.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/empty.rules"
        "ip6tables.service::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/ip6tables.service"
        "iptables-legacy-flush::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/iptables-legacy-flush"
        "iptables-nft-flush::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/iptables-nft-flush"
        "iptables.service::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/iptables.service"
        "simple_firewall.rules::https://gitlab.archlinux.org/archlinux/packaging/packages/iptables/-/raw/main/simple_firewall.rules")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
  cd "iptables"

  # use system one
  rm "include/linux/types.h"
}

pkgver() {
  cd "iptables"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iptables"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib/iptables" \
    --with-xtlibdir="/usr/lib/iptables" \
    --enable-bpf-compiler \
    --enable-devel \
    --enable-libipq
  make
}

package() {
  cd "iptables"

  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm644 "empty.rules" "$pkgdir/etc/iptables/iptables.rules"
  install -Dm644 "empty.rules" "$pkgdir/etc/iptables/ip6tables.rules"
  install -Dm644 "simple_firewall.rules" -t "$pkgdir/etc/iptables"
  install -Dm644 *.rules -t "$pkgdir/usr/share/iptables"

  install -Dm644 {arp,eb,ip,ip6}tables.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm755 iptables-{legacy,nft}-flush -t "$pkgdir/usr/lib/systemd/scripts/iptables-flush"
}
