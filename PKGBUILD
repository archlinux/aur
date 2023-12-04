# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

# PKGBUILD config
pkgname="ivpn"
pkgver=3.13.4
pkgrel=1
pkgdesc="IVPN - Secure VPN for Privacy (CLI)"
arch=('x86_64')
url="https://www.ivpn.net"
license=('GPL3')
depends=('glibc' 'lsof' 'wireless_tools' 'openvpn')
makedepends=('make' 'curl' 'go>=1.19' 'git' 'cmake' 'ninja')
install="ivpn.install"

# INSTALLATION SOURCES

# Default installation sources
source=("ivpn-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app/archive/v${pkgver}.tar.gz")
sha256sums=('28fc1a060a2a10e9a5f7bbe1ac35e8c4e0b40e250759d887d912502c5e0ea1f0')
src_prj_dir_name=desktop-app-${pkgver}

# Use bellow two lines to install package from beta branch
#source=("git+https://github.com/ivpn/desktop-app.git#branch=beta")
#md5sums=('SKIP')
#src_prj_dir_name=desktop-app

build() {
  echo "*** build daemon***"
  cd "$srcdir/$src_prj_dir_name/daemon"
  IVPN_BUILD_SKIP_GLIBC_VER_CHECK=true IVPN_BUILD_CAN_SKIP_DOWNLOAD_SERVERS=true ./References/Linux/scripts/build-all.sh -v ${pkgver} -c "${pkgver}_stamped"

  echo "*** build CLI ***"
  cd "$srcdir/$src_prj_dir_name/cli"
  IVPN_BUILD_SKIP_GLIBC_VER_CHECK=true ./References/Linux/compile-cli.sh -v ${pkgver} -c "${pkgver}_stamped"

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
  cd "$srcdir/$src_prj_dir_name/daemon"

  install -Dm755 -g root -o root References/Linux/scripts/_out_bin/ivpn-service "$pkgdir/usr/bin/ivpn-service"

  install -Dm700 -g root -o root References/Linux/etc/client.down "$pkgdir/opt/ivpn/etc/client.down"
  install -Dm700 -g root -o root References/Linux/etc/client.up "$pkgdir/opt/ivpn/etc/client.up"
  install -Dm700 -g root -o root References/Linux/etc/firewall.sh "$pkgdir/opt/ivpn/etc/firewall.sh"
  install -Dm700 -g root -o root References/Linux/etc/splittun.sh "$pkgdir/opt/ivpn/etc/splittun.sh"
  install -Dm600 -g root -o root References/common/etc/servers.json "$pkgdir/opt/ivpn/etc/servers.json"
  install -Dm400 -g root -o root References/common/etc/ca.crt "$pkgdir/opt/ivpn/etc/ca.crt"
  install -Dm400 -g root -o root References/common/etc/ta.key "$pkgdir/opt/ivpn/etc/ta.key"

  install -Dm755 -g root -o root References/Linux/_deps/wireguard-tools_inst/wg-quick "$pkgdir/opt/ivpn/wireguard-tools/wg-quick"
  install -Dm755 -g root -o root References/Linux/_deps/wireguard-tools_inst/wg "$pkgdir/opt/ivpn/wireguard-tools/wg"
  install -Dm755 -g root -o root References/Linux/_deps/obfs4proxy_inst/obfs4proxy "$pkgdir/opt/ivpn/obfsproxy/obfs4proxy"

  install -Dm755 -g root -o root References/Linux/_deps/dnscryptproxy_inst/dnscrypt-proxy "$pkgdir/opt/ivpn/dnscrypt-proxy/dnscrypt-proxy"
  install -Dm400 -g root -o root References/common/etc/dnscrypt-proxy-template.toml "$pkgdir/opt/ivpn/etc/dnscrypt-proxy-template.toml"

  install -Dm755 -g root -o root References/Linux/_deps/kem-helper/kem-helper-bin/kem-helper "$pkgdir/opt/ivpn/kem/kem-helper"
  install -Dm755 -g root -o root References/Linux/_deps/v2ray_inst/v2ray "$pkgdir/opt/ivpn/v2ray/v2ray"

  cd "$srcdir/$src_prj_dir_name/cli"
  install -Dm755 -g root -o root References/Linux/_out_bin/ivpn "$pkgdir/usr/bin/ivpn"

  cd "$srcdir"
  install -Dm644 "ivpn-service.service" "$pkgdir/usr/lib/systemd/system/ivpn-service.service"
}
