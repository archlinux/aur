# Maintainer: Clayton Craft <clayton@igalia.com>
pkgname=dnsmasq-nftset-git
pkgver=2.86test5.r1.g767d9cb
pkgrel=1
pkgdesc='Lightweight, easy to configure DNS forwarder and DHCP server, with nftset support enabled'
arch=('i686' 'x86_64')
url="http://www.thekelleys.org.uk/dnsmasq/doc.html"
license=('GPL')
depends=('glibc' 'gmp' 'libidn2' 'libdbus' 'libnetfilter_conntrack' 'nettle' 'nftables')
makedepends=('git')
provides=('dnsmasq')
conflicts=('dnsmasq')
backup=('etc/dnsmasq.conf')
source=("git://thekelleys.org.uk/dnsmasq.git"
        "dnsmasq-sysusers.conf::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/dnsmasq/trunk/dnsmasq-sysusers.conf"
        "dnsmasq.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/dnsmasq/trunk/dnsmasq.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "dnsmasq"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_build_copts="-DHAVE_DBUS -DHAVE_LIBIDN2 -DHAVE_CONNTRACK -DHAVE_DNSSEC -DHAVE_NFTSET"

build() {
  cd "dnsmasq"

  make \
    CFLAGS="$CPPFLAGS $CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    COPTS="$_build_copts" \
    all-i18n

  cd "contrib/lease-tools"
  make \
    CFLAGS="$CPPFLAGS $CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    COPTS="$_build_copts" \
    all
}

package() {
  cd "dnsmasq"

  make \
    COPTS="$_build_copts" \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    BINDIR="/usr/bin" \
    install \
    install-i18n

  install -Dm644 "dnsmasq.conf.example" "$pkgdir/etc/dnsmasq.conf"

  install -Dm644 "dbus/dnsmasq.conf" -t "$pkgdir/usr/share/dbus-1/system.d"

  install -Dm644 "$srcdir/dnsmasq.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/dnsmasq-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/dnsmasq.conf"

  # DNSSEC setup
  sed -i 's,%%PREFIX%%,/usr,' "$pkgdir/etc/dnsmasq.conf"
  install -Dm644 "trust-anchors.conf" -t "$pkgdir/usr/share/dnsmasq"

  install -Dm755 "contrib/lease-tools"/dhcp_{release{,6},lease_time} -t "$pkgdir/usr/bin"
  install -Dm644 "contrib/lease-tools"/dhcp_{release{,6},lease_time}.1 -t "$pkgdir/usr/share/man/man1"
}


# vim: ts=2 sw=2 et ft=sh
