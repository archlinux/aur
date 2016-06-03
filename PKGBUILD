# $Id$
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Tom Killian <tom.archlinux.org>
# Contributor: Judd Vinet <jvinet.zeroflux.org>

pkgname=dhcpcd
pkgver=6.11.0
pkgrel=2
pkgdesc="RFC2131 compliant DHCP client daemon"
url="http://roy.marples.name/projects/dhcpcd/"
arch=('i686' 'x86_64')
license=('BSD')
groups=('base')
depends=('glibc' 'sh' 'udev' 'libsystemd')
optdepends=('openresolv: resolvconf support')
provides=('dhcp-client')
backup=('etc/dhcpcd.conf')
options=('emptydirs')  # We Need the Empty /var/lib/dhcpcd Directory
source=("http://roy.marples.name/downloads/$pkgname/$pkgname-$pkgver.tar.xz"
        "fix_truncated.patch::http://roy.marples.name/projects/dhcpcd/vpatch?from=ac4e95dcbdeba0ea&to=3fd740f3ed17e902"
        'dhcpcd_.service'
        'dhcpcd.service')
sha1sums=('f6e8245edd8469e5dad3fedd5c8c6a4e95daa8b5'
          'a10f1420174250e8c4ec6b25fce2222a2911f3c5'
          '6f1633edde14d29b5cdc09c4f029a450ef2ebc96'
          '52c1bad9ab43e9a253c1eb175e7eefb13497b8f9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix for http://roy.marples.name/projects/dhcpcd/tktview?name=3f10c9b871
  patch < ../fix_truncated.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # configure variables
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib/dhcpcd \
      --dbdir=/var/lib/dhcpcd \
      --rundir=/run

  # Build
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed 26q "$srcdir/$pkgname-$pkgver/control.h" \
      >>"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Set Options in /etc/dhcpcd.conf
  echo noipv4ll >> "${pkgdir}/etc/dhcpcd.conf" # Disable ip4vall

  # install systemd files
  install -Dm644 "${srcdir}/dhcpcd_.service" "${pkgdir}/usr/lib/systemd/system/dhcpcd@.service"
  install -Dm644 "${srcdir}/dhcpcd.service" "${pkgdir}/usr/lib/systemd/system/dhcpcd.service" # FS#31543
}
