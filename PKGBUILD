# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dhcpcd9-git
pkgver=9.5.2.r0.g842bf539
pkgrel=1
pkgdesc="A DHCP and DHCPv6 client (9.x releases)"
arch=('i686' 'x86_64')
url="https://roy.marples.name/projects/dhcpcd/"
license=('BSD')
depends=('glibc' 'glibc' 'sh' 'systemd-libs')
makedepends=('git')
optdepends=('openresolv: resolvconf support')
provides=("dhcpcd=$pkgver" 'dhcp-client')
conflicts=('dhcpcd')
backup=('etc/dhcpcd.conf')
options=('emptydirs')
install='dhcpcd.install'
source=("git+https://github.com/NetworkConfiguration/dhcpcd.git#branch=dhcpcd-9"
        "dhcpcd.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.service"
        "dhcpcd.sysusers::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.sysusers"
        "dhcpcd.tmpfiles::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd.tmpfiles"
        "dhcpcd_.service::https://gitlab.archlinux.org/archlinux/packaging/packages/dhcpcd/-/raw/main/dhcpcd_.service")
sha256sums=('SKIP'
            '843913ee4cd77ca51ab1f1d21eb13650df3791db2b8526a9b0c9acf2d6b9c63f'
            '06788ad9f5f7ccb5d2a2da6f0322ff5771f8de82cfbe8b9ad954f2c38265e21b'
            '1ca593a91d537766d073e71cfab87881e6f6a2ccb5236a45531d5520b3af7a31'
            'a2495b4a4632f9ee6d5d40877eb9667aaa3f64e035dbd8ccfc029a3a2339f069')


pkgver() {
  cd "dhcpcd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v9[0-9\.]+$' | head -n1)
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
    --privsepuser="dhcpcd" \
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
  install -Dm644 "$srcdir/dhcpcd.sysusers" "$pkgdir/usr/lib/sysusers.d/dhcpcd.conf"
  install -Dm644 "$srcdir/dhcpcd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/dhcpcd.conf"
  install -Dm644 "$srcdir/dhcpcd_.service" "$pkgdir/usr/lib/systemd/system/dhcpcd@.service"
}
