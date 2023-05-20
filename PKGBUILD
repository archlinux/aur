# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dhcpcd8-git
pkgver=8.1.9.r7.g9095f26a
pkgrel=2
pkgdesc="A DHCP and DHCPv6 client (8.x releases)"
arch=('i686' 'x86_64')
url="https://roy.marples.name/projects/dhcpcd/"
license=('BSD')
depends=('gcc-libs' 'glibc' 'sh' 'systemd-libs')
makedepends=('git')
optdepends=('openresolv: resolvconf support')
provides=("dhcpcd=$pkgver" 'dhcp-client')
conflicts=('dhcpcd')
backup=('etc/dhcpcd.conf')
options=('emptydirs')
source=("git+https://github.com/NetworkConfiguration/dhcpcd.git#branch=dhcpcd-8"
        "dhcpcd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.service"
        "dhcpcd_.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd_.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


pkgver() {
  cd "dhcpcd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v8[0-9\.]+$' | head -n1)
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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/dhcpcd"

  # Disable ip4vall
  echo "noipv4ll" >> "$pkgdir/etc/dhcpcd.conf"

  install -Dm644 "$srcdir/dhcpcd.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/dhcpcd_.service" "$pkgdir/usr/lib/systemd/system/dhcpcd@.service"
}
