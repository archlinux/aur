# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ppp-git
pkgver=2.4.8.r26.gad3937a
pkgrel=1
pkgdesc="A package which implements the Point-to-Point Protocol"
arch=('i686' 'x86_64')
url="https://ppp.samba.org/"
license=('BSD' 'GPL')
depends=('glibc' 'pam' 'libpcap')
makedepends=('git')
provides=('ppp')
conflicts=('ppp')
source=("git+https://github.com/paulusmack/ppp.git"
        "CVE-2015-3310.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/CVE-2015-3310.patch?h=packages/ppp"
        "ip-up::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip-up?h=packages/ppp"
        "ip-down::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip-down?h=packages/ppp"
        "ipv6-up::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ipv6-up?h=packages/ppp"
        "ipv6-down::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ipv6-down?h=packages/ppp"
        "ip-up.d.dns.sh::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip-up.d.dns.sh?h=packages/ppp"
        "ip-down.d.dns.sh::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ip-down.d.dns.sh?h=packages/ppp"
        "ipv6-up.d.iface-config.sh::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ipv6-up.d.iface-config.sh?h=packages/ppp"
        "options::https://git.archlinux.org/svntogit/packages.git/plain/trunk/options?h=packages/ppp"
        "ppp.systemd::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ppp.systemd?h=packages/ppp")
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
            'SKIP')


prepare() {
  cd "ppp"

  patch -p1 -i "$srcdir/CVE-2015-3310.patch"
}

pkgver() {
  cd "ppp"

  git describe --long --tags | sed 's/^ppp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ppp"

  ./configure
  sed -i 's:^#FILTER=y:FILTER=y:' "pppd/Makefile"  # enable active filter
  sed -i 's:^#HAVE_INET6=y:HAVE_INET6=y:' "pppd/Makefile"  # enable ipv6 support
  sed -i 's:^#CBCP=y:CBCP=y:' "pppd/Makefile"  # enable Microsoft proprietary CallBack Control Protocol
  sed -i 's:^#USE_PAM=y:USE_PAM=y:' "pppd/Makefile"
  sed -i 's:^#SYSTEMD=y:SYSTEMD=y:' "pppd/Makefile"

  make
}

package() {
  cd "ppp"

  make DESTDIR="$pkgdir/usr" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/options" -t "$pkgdir/etc/ppp"
  install -Dm755 "$srcdir"/{ip,ipv6}-{down,up} -t "$pkgdir/etc/ppp"

  install -Dm755 "$srcdir/ip-up.d.dns.sh" "$pkgdir/etc/ppp/ip-up.d/00-dns.sh"
  install -Dm755 "$srcdir/ip-down.d.dns.sh" "$pkgdir/etc/ppp/ip-down.d/00-dns.sh"

  install -Dm755 "$srcdir/ipv6-up.d.iface-config.sh" "$pkgdir/etc/ppp/ipv6-up.d/00-iface-config.sh"
  install -dm755 "$pkgdir/etc/ppp/ipv6-down.d"

  install -dm700 "$pkgdir/etc/ppp/peers"

  install -Dm600 "etc.ppp"/{chap-secrets,pap-secrets} -t "$pkgdir/etc/ppp"
  install -Dm755 "scripts"/{plog,poff,pon} -t "$pkgdir/usr/bin"
  install -Dm644 "scripts/pon.1" -t "$pkgdir/usr/share/man/man1"

  install -Dm644 "$srcdir/ppp.systemd" "$pkgdir/usr/lib/systemd/system/ppp@.service"
}
