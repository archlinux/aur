# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dnsmasq-git
pkgver=2.89.r39.g1d6fe0e
pkgrel=1
pkgdesc="Lightweight, easy to configure DNS forwarder and DHCP server"
arch=('i686' 'x86_64')
url="https://thekelleys.org.uk/dnsmasq/doc.html"
license=('GPL')
depends=('glibc' 'gmp' 'libdbus' 'libidn2' 'libnetfilter_conntrack' 'nettle')
makedepends=('git')
provides=("dnsmasq=$pkgver")
conflicts=('dnsmasq')
backup=('etc/dnsmasq.conf')
source=("git+https://thekelleys.org.uk/git/dnsmasq.git"
        "dnsmasq-sysusers.conf::https://gitlab.archlinux.org/archlinux/packaging/packages/dnsmasq/-/raw/main/dnsmasq-sysusers.conf"
        "dnsmasq.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dnsmasq/-/raw/main/dnsmasq.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


_build_copts=" \
  -DHAVE_CONNTRACK \
  -DHAVE_DBUS \
  -DHAVE_DNSSEC \
  -DHAVE_LIBIDN2"

pkgver() {
  cd "dnsmasq"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
