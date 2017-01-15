# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Mostly taken from the core Arch package

pkgname=dhcpcd-without-systemd
pkgver=6.11.5
pkgrel=1
pkgdesc="RFC2131 compliant DHCP client daemon. Compiled without udev support (ergo, without a dependency on systemd)."
url="http://roy.marples.name/projects/dhcpcd/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc' 'sh')
optdepends=('openresolv: resolvconf support')
provides=('dhcpcd' 'dhcp-client')
conflicts=('dhcpcd')
backup=('etc/dhcpcd.conf')
options=('emptydirs')  # We Need the Empty /var/lib/dhcpcd Directory
source=("http://roy.marples.name/downloads/dhcpcd/dhcpcd-$pkgver.tar.xz")
sha1sums=('aa0a97682cb7dad3ea0acfe623a67da42614a2d8')

build() {
  cd "${srcdir}/dhcpcd-${pkgver}"

  # configure variables
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib/dhcpcd \
      --dbdir=/var/lib/dhcpcd \
      --rundir=/run \
      --without-udev

  # Build
  make
}

check() {
  cd "${srcdir}/dhcpcd-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/dhcpcd-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed 26q "$srcdir/dhcpcd-$pkgver/control.h" \
      >>"$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Set Options in /etc/dhcpcd.conf
  echo noipv4ll >> "${pkgdir}/etc/dhcpcd.conf" # Disable ip4vall
}
