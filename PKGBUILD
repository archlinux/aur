# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dhcpcd-git
pkgver=7.1.1.r31.gf1713f60
pkgrel=1
pkgdesc="A DHCP and DHCPv6 client"
arch=('i686' 'x86_64')
url="https://roy.marples.name/projects/dhcpcd"
license=('BSD')
depends=('glibc' 'sh' 'systemd-libs')
makedepends=('git')
optdepends=('openresolv: resolvconf support')
provides=('dhcpcd' 'dhcp-client')
conflicts=('dhcpcd')
backup=('etc/dhcpcd.conf')
options=('emptydirs')
source=("git+https://roy.marples.name/git/dhcpcd.git"
        "dhcpcd.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/dhcpcd.service?h=packages/dhcpcd"
        "dhcpcd_.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/dhcpcd_.service?h=packages/dhcpcd")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "dhcpcd"

  git describe --long --tags | sed 's/^dhcpcd-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dhcpcd"

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
  cd "dhcpcd"

  make test
}

package() {
  cd "dhcpcd"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/dhcpcd/LICENSE"

  # Disable ip4vall
  echo "noipv4ll" >> "$pkgdir/etc/dhcpcd.conf"

  install -Dm644 "$srcdir/dhcpcd.service" "$pkgdir/usr/lib/systemd/system/dhcpcd.service"
  install -Dm644 "$srcdir/dhcpcd_.service" "$pkgdir/usr/lib/systemd/system/dhcpcd@.service"
}
