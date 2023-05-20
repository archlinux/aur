# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dhcpcd8
pkgver=8.1.9
pkgrel=3
pkgdesc="A DHCP and DHCPv6 client (8.x releases)"
arch=('i686' 'x86_64')
url="https://roy.marples.name/projects/dhcpcd/"
license=('BSD')
depends=('glibc' 'sh' 'systemd-libs')
optdepends=('openresolv: resolvconf support')
provides=("dhcpcd=$pkgver")
conflicts=('dhcpcd')
backup=('etc/dhcpcd.conf')
options=('emptydirs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/dhcpcd-$pkgver.tar.gz"
        "dhcpcd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.service"
        "dhcpcd_.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd_.service")
sha256sums=('951ec48cb5a5113cccfcdc713e909023df08f17adca3f74c52afc1d16c519398'
            '20bccbf8a05b1bc2be365c8b4b526c38c752f48229ba53c3be113ac5b634f210'
            '37acd53a589711f5e1db2fcaebb4ccf1c90dc4bcd309626bde25beb7b630a545')


build() {
  cd "dhcpcd-dhcpcd-$pkgver"

  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib/dhcpcd" \
    --dbdir="/var/lib/dhcpcd" \
    --rundir="/run"
  make
}

check() {
  cd "dhcpcd-dhcpcd-$pkgver"

  make test
}

package() {
  cd "dhcpcd-dhcpcd-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/dhcpcd"

  # Disable ip4vall
  echo "noipv4ll" >> "$pkgdir/etc/dhcpcd.conf"

  install -Dm644 "$srcdir/dhcpcd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/dhcpcd_.service" "$pkgdir/usr/lib/systemd/system/dhcpcd@.service"
}
