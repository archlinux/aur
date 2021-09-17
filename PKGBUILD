# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgbase=dnsmasq
pkgname=${_pkgbase}285
pkgver=2.85
pkgrel=1
pkgdesc='Lightweight, easy to configure DNS forwarder and DHCP server (legacy, 2.85)'
url='http://www.thekelleys.org.uk/dnsmasq/doc.html'
arch=('x86_64')
license=('GPL')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
depends=('glibc' 'gmp' 'libidn2' 'libidn2.so' 'libdbus' 'libdbus-1.so'
         'libnetfilter_conntrack' 'nettle' 'libnettle.so' 'libhogweed.so')
backup=('etc/dnsmasq.conf')
validpgpkeys=('D6EACBD6EE46B834248D111215CDDA6AE19135A2') # Simon Kelley <simon@thekelleys.org.uk>
source=("http://www.thekelleys.org.uk/${_pkgbase}/${_pkgbase}-$pkgver.tar.xz"{,.asc}
        'dnsmasq-sysusers.conf'
        'dnsmasq.service')
sha256sums=('ad98d3803df687e5b938080f3d25c628fe41c878752d03fbc6199787fee312fa'
            'SKIP'
            '7f6ff6a709038ae580758f4b6a754451d7f7ce22957b88a36b97f7b643d3c2ab'
            '297dbae8cfa3d353284820dd87cc65c37d1ef289cac3a5c3ede079413d31eeec')

_build_copts='-DHAVE_DNSSEC -DHAVE_DBUS -DHAVE_LIBIDN2 -DHAVE_CONNTRACK'

build() {
  cd "${_pkgbase}-$pkgver"

  make \
    CFLAGS="$CPPFLAGS $CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    COPTS="$_build_copts" \
    PREFIX=/usr \
    BINDIR=/usr/bin \
    all-i18n

  cd "contrib/lease-tools"

  make \
    CFLAGS="$CPPFLAGS $CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    COPTS="$_build_copts" \
    all
}

package() {
  cd "${_pkgbase}-$pkgver"

  # need to pass COPTS here to avoid rebuilding the binary.
  make \
    COPTS="$_build_copts" \
    PREFIX=/usr \
    BINDIR=/usr/bin \
    DESTDIR="$pkgdir" \
    install install-i18n

  install -Dm0644 "dbus/dnsmasq.conf" "$pkgdir"/usr/share/dbus-1/system.d/dnsmasq.conf
  install -Dm0644 "dnsmasq.conf.example" "$pkgdir"/etc/dnsmasq.conf
  install -Dm0644 "$srcdir/dnsmasq.service" "$pkgdir"/usr/lib/systemd/system/dnsmasq.service
  install -Dm0644 "$srcdir/dnsmasq-sysusers.conf" "$pkgdir"/usr/lib/sysusers.d/dnsmasq.conf

  # DNSSEC setup
  sed -i 's,%%PREFIX%%,/usr,' "$pkgdir"/etc/dnsmasq.conf
  install -Dm0644 "trust-anchors.conf" "$pkgdir"/usr/share/dnsmasq/trust-anchors.conf

  install -Dm0755 -t "$pkgdir"/usr/bin/ 'contrib/lease-tools/dhcp_'{release{,6},lease_time}
  install -Dm0644 -t "$pkgdir"/usr/share/man/man1 'contrib/lease-tools/dhcp_'{release{,6},lease_time}.1
}

# vim: ts=2 sw=2 et ft=sh
