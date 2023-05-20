# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dhcpcd8
pkgver=8.1.9
pkgrel=4
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
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v$pkgver.tar.gz"
        "dhcpcd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.service"
        "dhcpcd_.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd_.service")
sha256sums=('aa62732df3bfa26b0610a70e4f696e49a9d198896876b5e721dbaa6f7097dd29'
            '843913ee4cd77ca51ab1f1d21eb13650df3791db2b8526a9b0c9acf2d6b9c63f'
            'a2495b4a4632f9ee6d5d40877eb9667aaa3f64e035dbd8ccfc029a3a2339f069')


build() {
  cd "dhcpcd-$pkgver"

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
  cd "dhcpcd-$pkgver"

  make test
}

package() {
  cd "dhcpcd-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/dhcpcd"

  # Disable ip4vall
  echo "noipv4ll" >> "$pkgdir/etc/dhcpcd.conf"

  install -Dm644 "$srcdir/dhcpcd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/dhcpcd_.service" "$pkgdir/usr/lib/systemd/system/dhcpcd@.service"
}
