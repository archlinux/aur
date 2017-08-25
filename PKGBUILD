# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dnsmasq-git
pkgver=2.78test2.r6.g69a815a
pkgrel=1
pkgdesc="Lightweight, easy to configure DNS forwarder and DHCP server"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libmicrohttpd/"
license=('GPL')
depends=('glibc' 'gmp' 'libidn2' 'libdbus' 'libnetfilter_conntrack' 'nettle')
makedepends=('git')
provides=('dnsmasq')
conflicts=('dnsmasq')
source=("git://thekelleys.org.uk/dnsmasq.git"
        "dnsmasq-sysusers.conf::https://git.archlinux.org/svntogit/packages.git/plain/trunk/dnsmasq-sysusers.conf?h=packages/dnsmasq"
        "dnsmasq.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/dnsmasq.service?h=packages/dnsmasq")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "dnsmasq"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_build_copts="-DHAVE_DBUS -DHAVE_LIBIDN2 -DHAVE_CONNTRACK -DHAVE_DNSSEC"

build() {
  cd "dnsmasq"

  make CFLAGS="$CPPFLAGS $CFLAGS" LDFLAGS="$LDFLAGS" COPTS="$_build_copts" \
    all-i18n
}

package() {
  cd "dnsmasq"

  make COPTS="$_build_copts" DESTDIR="$pkgdir" PREFIX="/usr" BINDIR="/usr/bin" \
    install install-i18n

  install -Dm644 "dnsmasq.conf.example" "$pkgdir/etc/dnsmasq.conf"

  install -Dm644 "dbus/dnsmasq.conf" "$pkgdir/usr/share/dbus-1/system.d/dnsmasq.conf"

  install -Dm644 "$srcdir/dnsmasq.service" "$pkgdir/usr/lib/systemd/system/dnsmasq.service"
  install -Dm644 "$srcdir/dnsmasq-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/dnsmasq.conf"

  # DNSSEC setup
  sed -i 's,%%PREFIX%%,/usr,' "$pkgdir/etc/dnsmasq.conf"
  install -Dm644 "trust-anchors.conf" "$pkgdir/usr/share/dnsmasq/trust-anchors.conf"
}
