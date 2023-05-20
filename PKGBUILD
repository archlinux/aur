# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dhcpcd-git
pkgver=10.0.1.r25.g6a369c6d
pkgrel=1
pkgdesc="A DHCP and DHCPv6 client"
arch=('i686' 'x86_64')
url="https://roy.marples.name/projects/dhcpcd/"
license=('BSD')
depends=('glibc' 'sh' 'systemd-libs')
makedepends=('git')
optdepends=('openresolv: resolvconf support')
provides=("dhcpcd=$pkgver" 'dhcp-client')
conflicts=('dhcpcd')
backup=('etc/dhcpcd.conf')
options=('emptydirs')
source=("git+https://github.com/rsmarples/dhcpcd.git"
        "dhcpcd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.service"
        "dhcpcd.sysusers::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.sysusers"
        "dhcpcd.tmpfiles::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.tmpfiles"
        "dhcpcd_.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd_.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "dhcpcd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "dhcpcd"

  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib/dhcpcd" \
    --dbdir="/var/lib/dhcpcd" \
    --runstatedir="/run" \
    --privsepuser="dhcpcd"
  make
}

check() {
  cd "dhcpcd"

  make test
}

package() {
  cd "dhcpcd"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/dhcpcd"

  # Disable ip4vall
  echo "noipv4ll" >> "$pkgdir/etc/dhcpcd.conf"

  install -Dm644 "$srcdir/dhcpcd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/dhcpcd_.service" "$pkgdir/usr/lib/systemd/system/dhcpcd@.service"
  install -Dm644 "$srcdir/dhcpcd.sysusers" "$pkgdir/usr/lib/sysusers.d/dhcpcd.conf"
  install -Dm644 "$srcdir/dhcpcd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dhcpcd.conf"
}
