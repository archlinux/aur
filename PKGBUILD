# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iptables-nosystemd-minimal-git
pkgver=1.8.4.r38.g200bc399
pkgrel=1
pkgdesc="Userspace command line program used to configure the packet filtering ruleset"
arch=('i686' 'x86_64')
url="https://www.netfilter.org/projects/iptables/index.html"
license=('GPL2')
depends=('glibc' 'libmnl' 'libnftnl' 'libnetfilter_conntrack')
makedepends=('git' 'linux-api-headers')
provides=('arptables' 'ebtables' 'iptables' 'iptables-nft')
conflicts=('arptables' 'ebtables' 'iptables' 'iptables-nft')
backup=('etc/ethertypes'
        etc/iptables/{ip,ip6}tables.rules)
source=("git://git.netfilter.org/iptables"
        "arptables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/arptables.service?h=packages/iptables"
        "ebtables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ebtables.service?h=packages/iptables"
        "empty-filter.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-filter.rules?h=packages/iptables"
        "empty-mangle.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-mangle.rules?h=packages/iptables"
        "empty-nat.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-nat.rules?h=packages/iptables"
        "empty-raw.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-raw.rules?h=packages/iptables"
        "empty-security.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-security.rules?h=packages/iptables"
        "empty.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty.rules?h=packages/iptables"
        "ip6tables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip6tables.service?h=packages/iptables"
        "iptables-legacy-flush::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables-legacy-flush?h=packages/iptables"
        "iptables-nft-flush::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables-nft-flush?h=packages/iptables"
        "iptables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables.service?h=packages/iptables"
        "simple_firewall.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/simple_firewall.rules?h=packages/iptables")
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
    --disable-libipq \
    --disable-bpf-compiler \
    --disable-nfsynproxy \
    --disable-ipv6
  make
}

package() {
  cd "iptables"

  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm644 "empty.rules" "$pkgdir/etc/iptables/iptables.rules"
  install -Dm644 "empty.rules" "$pkgdir/etc/iptables/ip6tables.rules"
  install -Dm644 "simple_firewall.rules" -t "$pkgdir/etc/iptables"

  install -d "$pkgdir/var/lib"/{iptables,ip6tables}
  install -m644 empty-{filter,mangle,nat,raw,security}.rules "$pkgdir/var/lib/iptables"
  install -m644 empty-{filter,mangle,nat,raw,security}.rules "$pkgdir/var/lib/ip6tables"

#  install -d "$pkgdir/usr/lib/systemd/system"
#  install -m644 {arp,eb,ip,ip6}tables.service "$pkgdir/usr/lib/systemd/system"
#  install -Dm755 iptables-{legacy,nft}-flush "$pkgdir/usr/lib/systemd/scripts/iptables-flush"
}
