# Maintainer: Haonan Chen <g897331845@gmail.com>

pkgname=dnsmasq-regex
_commit='74aee42'
pkgver=2.85.regex2
pkgrel=1
pkgdesc='Lightweight, easy to configure DNS forwarder and DHCP server, with regex support'
url='https://github.com/lixingcong/dnsmasq-regex'
arch=('x86_64')
license=('GPL')
provides=('dnsmasq')
conflicts=('dnsmasq')
makedepends=('git')
depends=('glibc' 'gmp' 'libidn2' 'libidn2.so' 'libdbus' 'libdbus-1.so'
         'libnetfilter_conntrack' 'nettle' 'libnettle.so' 'libhogweed.so')
backup=('etc/dnsmasq.conf')
source=("git+https://github.com/lixingcong/dnsmasq-regex.git#commit=$_commit"
        "Makefile.patch"
        "git://thekelleys.org.uk/dnsmasq.git#tag=v2.85"
        'dnsmasq-sysusers.conf'
        'dnsmasq.service')
sha256sums=('SKIP'
            '1166f61d5d9d004f8f9cc324349c6bad68774e5dd75cb10ba173b298780580f4'
            'SKIP'
            '7f6ff6a709038ae580758f4b6a754451d7f7ce22957b88a36b97f7b643d3c2ab'
            '297dbae8cfa3d353284820dd87cc65c37d1ef289cac3a5c3ede079413d31eeec')

prepare() {
  cd dnsmasq-regex
  git submodule init
  git config submodule.dnsmasq.url $srcdir/dnsmasq
  git submodule update

  git apply ../Makefile.patch
}


_build_copts='-DHAVE_DNSSEC -DHAVE_DBUS -DHAVE_LIBIDN2 -DHAVE_CONNTRACK -DHAVE_REGEX -DHAVE_REGEX_IPSET'

build() {
  cd "dnsmasq-regex"
  make patch

  cd dnsmasq
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
  cd "dnsmasq-regex/dnsmasq"

  # need to pass COPTS here to avoid rebuilding the binary.
  make \
    COPTS="$_build_copts" \
    PREFIX=/usr \
    BINDIR=/usr/bin \
    DESTDIR="$pkgdir" \
    install install-i18n

  install -Dm0644 "dbus/dnsmasq.conf" "$pkgdir"/usr/share/dbus-1/system.d/dnsmasq.conf
  install -Dm0644 "dnsmasq.conf.example" "$pkgdir"/etc/dnsmasq.conf
  install -Dm0644 "../dnsmasq_regex_example.conf" "$pkgdir"/etc/dnsmasq.d/dnsmasq-regex.conf
  install -Dm0644 "$srcdir/dnsmasq.service" "$pkgdir"/usr/lib/systemd/system/dnsmasq.service
  install -Dm0644 "$srcdir/dnsmasq-sysusers.conf" "$pkgdir"/usr/lib/sysusers.d/dnsmasq.conf

  # DNSSEC setup
  sed -i 's,%%PREFIX%%,/usr,' "$pkgdir"/etc/dnsmasq.conf
  install -Dm0644 "trust-anchors.conf" "$pkgdir"/usr/share/dnsmasq/trust-anchors.conf

  install -Dm0755 -t "$pkgdir"/usr/bin/ 'contrib/lease-tools/dhcp_'{release{,6},lease_time}
  install -Dm0644 -t "$pkgdir"/usr/share/man/man1 'contrib/lease-tools/dhcp_'{release{,6},lease_time}.1
}

# vim: ts=2 sw=2 et ft=sh
