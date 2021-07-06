# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iptables-git
pkgver=1.8.7.r37.g9e1fffdf
pkgrel=1
pkgdesc="Userspace command line program used to configure the packet filtering ruleset"
arch=('i686' 'x86_64')
url="https://www.netfilter.org/projects/iptables/index.html"
license=('GPL2')
depends=('glibc' 'libmnl' 'libnftnl' 'libpcap')
makedepends=('git' 'linux-api-headers')
provides=('arptables' 'ebtables' 'iptables' 'iptables-nft')
conflicts=('arptables' 'ebtables' 'iptables' 'iptables-nft')
backup=('etc/ethertypes'
        etc/iptables/{ip,ip6}tables.rules)
source=("git://git.netfilter.org/iptables"
        "arptables.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/arptables.service"
        "ebtables.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/ebtables.service"
        "empty-filter.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/empty-filter.rules"
        "empty-mangle.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/empty-mangle.rules"
        "empty-nat.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/empty-nat.rules"
        "empty-raw.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/empty-raw.rules"
        "empty-security.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/empty-security.rules"
        "empty.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/empty.rules"
        "ip6tables.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/ip6tables.service"
        "iptables-legacy-flush::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/iptables-legacy-flush"
        "iptables-nft-flush::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/iptables-nft-flush"
        "iptables.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/iptables.service"
        "simple_firewall.rules::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/iptables/trunk/simple_firewall.rules")
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
    --enable-devel \
    --enable-libipq \
    --enable-bpf-compiler
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
