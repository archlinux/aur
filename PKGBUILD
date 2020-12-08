# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

# dependencies versions
_ver_ivpn_daemon=2.12.13
_ver_ivpn_cli=2.12.11

# PKGBUILD config
pkgname="ivpn"
pkgver=2.12.13
pkgrel=1
pkgdesc="IVPN Command Line Interface"
arch=('x86_64')
url="https://ivpn.net"
license=('GPL3')
depends=('glibc' 'wireless_tools' 'openvpn' 'wireguard-tools')
makedepends=('curl' 'go')
install="ivpn.install"
source=(
"ivpn-daemon-src-v${_ver_ivpn_daemon}.tar.gz::https://github.com/ivpn/desktop-app-daemon/archive/v${_ver_ivpn_daemon}.tar.gz"
"ivpn-cli-src-v${_ver_ivpn_cli}.tar.gz::https://github.com/ivpn/desktop-app-cli/archive/v${_ver_ivpn_cli}.tar.gz"
)
sha256sums=(
'ad7976e089fcf0d7c192b40a6947b6480c67eb88a50d9feb6ef246e7e0e2d174' # daemon sources
'a7dcec032b2542770facf81aa896c596f240dcc00b4fb6d47dcb20cf48c2164d' # CLI sources
)

build() {
  # build daemon
  cd "$srcdir/desktop-app-daemon-${_ver_ivpn_daemon}"
  ./References/Linux/scripts/build-all.sh -v $_ver_ivpn_daemon -c "${_ver_ivpn_daemon}_stamped"

  # build CLI
  cd "$srcdir/desktop-app-cli-${_ver_ivpn_cli}"
  ./References/Linux/build.sh -v $_ver_ivpn_daemon -c "${_ver_ivpn_daemon}_stamped"

  # prepare '*.service' file for systemd
  cat > "$srcdir/ivpn-service.service" << EOF
  [Unit]
  Description=ivpn-service

  [Service]
  Type=simple
  User=root
  Group=root
  # Load env vars from /etc/default/ and /etc/sysconfig/ if they exist.
  # Prefixing the path with '-' makes it try to load, but if the file doesn't
  # exist, it continues onward.
  EnvironmentFile=-/etc/default/ivpn-service
  EnvironmentFile=-/etc/sysconfig/ivpn-service
  ExecStart=/usr/local/bin/ivpn-service
  Restart=always
  WorkingDirectory=/

  # When stopping, how long to wait before giving up and sending SIGKILL?
  # Keep in mind that SIGKILL on a process can cause data loss.
  TimeoutStopSec=infinity

  [Install]
  WantedBy=multi-user.target
EOF
}

package() {
  cd "$srcdir/desktop-app-daemon-${_ver_ivpn_daemon}"

  install -D References/Linux/scripts/_out_bin/ivpn-service "$pkgdir/usr/local/bin/ivpn-service"

  install -Dm700 -g root -o root References/Linux/etc/client.down "$pkgdir/opt/ivpn/etc/client.down"
  install -Dm700 -g root -o root References/Linux/etc/client.up "$pkgdir/opt/ivpn/etc/client.up"
  install -Dm700 -g root -o root References/Linux/etc/firewall.sh "$pkgdir/opt/ivpn/etc/firewall.sh"
  install -Dm600 -g root -o root References/Linux/etc/servers.json "$pkgdir/opt/ivpn/etc/servers.json"
  install -Dm400 -g root -o root References/Linux/etc/ca.crt "$pkgdir/opt/ivpn/etc/ca.crt"
  install -Dm400 -g root -o root References/Linux/etc/signing.pub "$pkgdir/opt/ivpn/etc/signing.pub"
  install -Dm400 -g root -o root References/Linux/etc/ta.key "$pkgdir/opt/ivpn/etc/ta.key"

  cd "$srcdir/desktop-app-cli-${_ver_ivpn_cli}"
  install -D References/Linux/_out_bin/ivpn "$pkgdir/usr/local/bin/ivpn"

  cd "$srcdir"
  install -D "ivpn-service.service" "$pkgdir/usr/lib/systemd/system/ivpn-service.service"
}
