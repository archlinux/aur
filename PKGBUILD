# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

# PKGBUILD config
pkgname="ivpn"
pkgver=3.8.20
pkgrel=2
pkgdesc="IVPN - Secure VPN for Privacy (CLI)"
arch=('x86_64')
url="https://www.ivpn.net"
license=('GPL3')
depends=('glibc' 'lsof' 'wireless_tools' 'openvpn')
makedepends=('curl' 'go>=1.16' 'git')
install="ivpn.install"
source=("ivpn-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app/archive/v${pkgver}.tar.gz")
sha256sums=('de3e422aa2f6199b754276f1a0b24eca60a6d7d00ee844d79867e01bfc91ad7d')

build() {
  echo "*** build daemon***"
  cd "$srcdir/desktop-app-${pkgver}/daemon"
  ./References/Linux/scripts/build-all.sh -v ${pkgver} -c "${pkgver}_stamped"

  echo "*** build CLI ***"
  cd "$srcdir/desktop-app-${pkgver}/cli"
  ./References/Linux/compile-cli.sh -v ${pkgver} -c "${pkgver}_stamped"

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
  ExecStart=/usr/bin/ivpn-service
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
  cd "$srcdir/desktop-app-${pkgver}/daemon"

  install -Dm755 -g root -o root References/Linux/scripts/_out_bin/ivpn-service "$pkgdir/usr/bin/ivpn-service"

  install -Dm700 -g root -o root References/Linux/etc/client.down "$pkgdir/opt/ivpn/etc/client.down"
  install -Dm700 -g root -o root References/Linux/etc/client.up "$pkgdir/opt/ivpn/etc/client.up"
  install -Dm700 -g root -o root References/Linux/etc/firewall.sh "$pkgdir/opt/ivpn/etc/firewall.sh"
  install -Dm700 -g root -o root References/Linux/etc/splittun.sh "$pkgdir/opt/ivpn/etc/splittun.sh"
  install -Dm600 -g root -o root References/Linux/etc/servers.json "$pkgdir/opt/ivpn/etc/servers.json"
  install -Dm400 -g root -o root References/Linux/etc/ca.crt "$pkgdir/opt/ivpn/etc/ca.crt"
  install -Dm400 -g root -o root References/Linux/etc/ta.key "$pkgdir/opt/ivpn/etc/ta.key"

  install -Dm755 -g root -o root References/Linux/_deps/wireguard-tools_inst/wg-quick "$pkgdir/opt/ivpn/wireguard-tools/wg-quick"
  install -Dm755 -g root -o root References/Linux/_deps/wireguard-tools_inst/wg "$pkgdir/opt/ivpn/wireguard-tools/wg"
  install -Dm755 -g root -o root References/Linux/_deps/obfs4proxy_inst/obfs4proxy "$pkgdir/opt/ivpn/obfsproxy/obfs4proxy"

  install -Dm755 -g root -o root References/Linux/_deps/dnscryptproxy_inst/dnscrypt-proxy "$pkgdir/opt/ivpn/dnscrypt-proxy/dnscrypt-proxy"
  install -Dm400 -g root -o root References/Linux/etc/dnscrypt-proxy-template.toml "$pkgdir/opt/ivpn/etc/dnscrypt-proxy-template.toml"

  cd "$srcdir/desktop-app-${pkgver}/cli"
  install -Dm755 -g root -o root References/Linux/_out_bin/ivpn "$pkgdir/usr/bin/ivpn"

  cd "$srcdir"
  install -D "ivpn-service.service" "$pkgdir/usr/lib/systemd/system/ivpn-service.service"
}
