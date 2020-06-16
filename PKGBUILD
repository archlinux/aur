# Maintainer: Gabriel Alcaras <gaalcaras@posteo.net>

pkgname="ivpn-git"
pkgver=2.12.3.r0.025fdcd
pkgrel=1
pkgdesc="IVPN command line interface"
arch=('x86_64')
url="https://ivpn.net"
license=('GPL')
depends=('glibc')
makedepends=('curl' 'fpm' 'git' 'go' 'rpm-tools')
provides=("$pkgname")
install="ivpn.install"
source=('git+https://github.com/ivpn/desktop-app-cli.git' 'git+https://github.com/ivpn/desktop-app-daemon.git')
noextract=()
md5sums=('SKIP' 'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/desktop-app-cli"

  printf "%s" "$(git describe --long | sed 's/^v\(.*\)$/\1/;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/desktop-app-daemon"
  ./References/Linux/scripts/build-all.sh

  cd "$srcdir/desktop-app-cli"
  ./References/Linux/build-packages.sh -v "${pkgver%.r*}"
}

package() {
  cd "$srcdir/desktop-app-daemon"

  install -D References/Linux/scripts/_out_bin/ivpn-service "$pkgdir/usr/local/bin/ivpn-service"

  # Required files with
  install -Dm700 -g root -o root References/Linux/etc/client.down "$pkgdir/opt/ivpn/etc/client.down"
  install -Dm700 -g root -o root References/Linux/etc/client.up "$pkgdir/opt/ivpn/etc/client.up"
  install -Dm700 -g root -o root References/Linux/etc/firewall.sh "$pkgdir/opt/ivpn/etc/firewall.sh"
  install -Dm600 -g root -o root References/Linux/etc/servers.json "$pkgdir/opt/ivpn/etc/servers.json"
  install -Dm400 -g root -o root References/Linux/etc/ca.crt "$pkgdir/opt/ivpn/etc/ca.crt"
  install -Dm400 -g root -o root References/Linux/etc/signing.pub "$pkgdir/opt/ivpn/etc/signing.pub"
  install -Dm400 -g root -o root References/Linux/etc/ta.key "$pkgdir/opt/ivpn/etc/ta.key"

  cd "$srcdir/desktop-app-cli"
  install -D References/Linux/_out_bin/ivpn "$pkgdir/usr/local/bin/ivpn"
  install -D References/Linux/_tmp/srvc/ivpn-service.dir/usr/share/pleaserun/ivpn-service/systemd/default/files/etc/systemd/system/ivpn-service.service "$pkgdir/usr/lib/systemd/system/ivpn-service.service"

}
