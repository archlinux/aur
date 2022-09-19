# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ppp-git
pkgver=2.4.9.r188.g35198ad
pkgrel=1
pkgdesc="A package which implements the Point-to-Point Protocol"
arch=('i686' 'x86_64')
url="https://ppp.samba.org/"
license=('BSD' 'GPL')
depends=('glibc' 'libpcap' 'libxcrypt' 'openssl' 'pam' 'systemd-libs')
makedepends=('git')
provides=("ppp=$pkgver")
conflicts=('ppp')
backup=(etc/ppp/{chap-secrets,ip-down,ip-down.d/00-dns.sh,ip-up,ip-up.d/00-dns.sh,ipv6-down,ipv6-up,ipv6-up.d/00-iface-config.sh,options,pap-secrets})
source=("git+https://github.com/paulusmack/ppp.git"
        "ip-down::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ip-down"
        "ip-down.d.dns.sh::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ip-down.d.dns.sh"
        "ip-up::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ip-up"
        "ip-up.d.dns.sh::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ip-up.d.dns.sh"
        "ipv6-down::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ipv6-down"
        "ipv6-up::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ipv6-up"
        "ipv6-up.d.iface-config.sh::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ipv6-up.d.iface-config.sh"
        "options::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/options"
        "ppp.systemd::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/ppp/trunk/ppp.systemd")
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

  git describe --long --tags | sed 's/^ppp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "ppp"

  ./autogen.sh \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --enable-cbcp \
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

  install -Dm600 "etc.ppp"/{chap-secrets,pap-secrets} -t "$pkgdir/etc/ppp"
  install -Dm755 "scripts"/{plog,poff,pon} -t "$pkgdir/usr/bin"
  install -Dm644 "scripts/pon.1" -t "$pkgdir/usr/share/man/man1"

  install -Dm644 "$srcdir/ppp.systemd" "$pkgdir/usr/lib/systemd/system/ppp@.service"
}
