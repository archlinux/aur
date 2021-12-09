# Maintainer: Clayton Craft <clayton@igalia.com>
# Contributor: Clayton Craft <clayton@igalia.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=dnsmasq-nftset
_pkgname=dnsmasq
pkgver=2.86
pkgrel=1
pkgdesc='Lightweight, easy to configure DNS forwarder and DHCP server, with nftset patches'
url='http://www.thekelleys.org.uk/dnsmasq/doc.html'
arch=('x86_64')
license=('GPL')
depends=('glibc' 'gmp' 'libidn2' 'libidn2.so' 'libdbus' 'libdbus-1.so'
         'libnetfilter_conntrack' 'nettle' 'libnettle.so' 'libhogweed.so')
provides=('dnsmasq')
conflicts=('dnsmasq')
backup=('etc/dnsmasq.conf')
validpgpkeys=('D6EACBD6EE46B834248D111215CDDA6AE19135A2') # Simon Kelley <simon@thekelleys.org.uk>
source=("http://www.thekelleys.org.uk/$_pkgname/$_pkgname-$pkgver.tar.xz"{,.asc}
        'dnsmasq-sysusers.conf'
        'dnsmasq.service'
        '0001-Add-nftset-option-like-ipset-but-for-the-newer-nftab.patch'
        '0002-Get-compilation-flags-for-libnftables-from-pkg-confi.patch')

sha256sums=('28d52cfc9e2004ac4f85274f52b32e1647b4dbc9761b82e7de1e41c49907eb08'
            'SKIP'
            '7f6ff6a709038ae580758f4b6a754451d7f7ce22957b88a36b97f7b643d3c2ab'
            '297dbae8cfa3d353284820dd87cc65c37d1ef289cac3a5c3ede079413d31eeec'
            'ee70166802252539139d449f468d1bc5ef6bed9913e56a09d44dffd5c28583c9'
            '83d77ee326d6718731a3909158a3a3d3567345c2aa875045fd0ee3e8170dd2e8')

_build_copts='-DHAVE_DNSSEC -DHAVE_DBUS -DHAVE_LIBIDN2 -DHAVE_CONNTRACK'

prepare() {
  cd "$_pkgname-$pkgver"

  patch -p1 -i "$srcdir/0001-Add-nftset-option-like-ipset-but-for-the-newer-nftab.patch"
  patch -p1 -i "$srcdir/0002-Get-compilation-flags-for-libnftables-from-pkg-confi.patch"
}

build() {
  cd "$_pkgname-$pkgver"

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
  cd "$_pkgname-$pkgver"

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
