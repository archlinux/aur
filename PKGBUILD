# Maintainer: Edward Pacman <micro DOT fedora AT gmail DOT com>

pkgname=iptables-fullcone-nat
pkgver=1.8.0.r85.g0800d9b4
pkgrel=1
pkgdesc="iptables with FULLCONENAT extension"
arch=('i686' 'x86_64')
url="https://github.com/Chion82/netfilter-full-cone-nat"
license=('GPL2')
depends=('glibc' 'libmnl' 'libnftnl' 'libpcap' 'netfilter-full-cone-nat-dkms')
makedepends=('git' 'linux-api-headers')
provides=('iptables')
conflicts=('iptables')
install=${pkgname}.install
source=("file:///usr/src/netfilter-full-cone-nat-git+ec14efe/libipt_FULLCONENAT.c"
	"git://git.netfilter.org/iptables"
        "empty-filter.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-filter.rules?h=packages/iptables"
        "empty-mangle.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-mangle.rules?h=packages/iptables"
        "empty-nat.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-nat.rules?h=packages/iptables"
        "empty-raw.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-raw.rules?h=packages/iptables"
        "empty-security.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty-security.rules?h=packages/iptables"
        "empty.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/empty.rules?h=packages/iptables"
        "ip6tables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip6tables.service?h=packages/iptables"
        "iptables-flush::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables-flush?h=packages/iptables"
        "iptables.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/iptables.service?h=packages/iptables"
        "simple_firewall.rules::https://git.archlinux.org/svntogit/packages.git/plain/trunk/simple_firewall.rules?h=packages/iptables"
        "iptables-fullcone-nat.install")
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
            '28c1f28f2e8b2b95b562ff807ac472134f27da350cb787f7e0f2d59f80d16ac0')


pkgver() {
  cd "iptables"
  cp ../libipt_FULLCONENAT.c extensions/
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iptables"

  ./autogen.sh
  ./configure --prefix="/usr" --sysconfdir="/etc" --sbindir="/usr/bin" --libexecdir="/usr/lib/iptables" --with-xtlibdir="/usr/lib/iptables" \
    --enable-bpf-compiler
  make
}

package() {
  cd "iptables"

  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm644 "empty.rules" "$pkgdir/etc/iptables/empty.rules"
  install -Dm644 "simple_firewall.rules" "$pkgdir/etc/iptables/simple_firewall.rules"

  install -d "$pkgdir/var/lib"/{iptables,ip6tables}
  install -m644 empty-{filter,mangle,nat,raw,security}.rules "$pkgdir/var/lib/iptables"
  install -m644 empty-{filter,mangle,nat,raw,security}.rules "$pkgdir/var/lib/ip6tables"

  install -Dm644 "iptables.service" "$pkgdir/usr/lib/systemd/system/iptables.service"
  install -Dm644 "ip6tables.service" "$pkgdir/usr/lib/systemd/system/ip6tables.service"
  install -Dm755 "iptables-flush" "$pkgdir/usr/lib/systemd/scripts/iptables-flush"
}
