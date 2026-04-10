# Maintainer: Cypher-Monarch <monarchcypher@gmail.com>

pkgname=cyphergatevpn-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Cross-platform VPN GUI for OpenVPN - Binary release"
arch=('x86_64')
url="https://github.com/Cypher-Monarch/CypherGate"
license=('MIT')
depends=('openvpn')
provides=('cyphergate-vpn')
conflicts=('cyphergate-vpn')

source=("https://github.com/Cypher-Monarch/CypherGate/releases/download/v$pkgver/CypherGate-Linux-v${pkgver}.tar.xz")
sha256sums=('9cc874c6435ed73399a28c2164526a8070dfd77f546fd65d61a955c9d283a9d0')

install=cyphergatevpn-bin.install

package() {
  cd "$srcdir/CypherGate-Linux-v$pkgver"

  # /opt install
  install -d "$pkgdir/opt/CypherGate"
  install -Dm755 "cyphergate.elf" "$pkgdir/opt/CypherGate/cyphergate"
  install -Dm755 "cyphergated.elf" "$pkgdir/opt/CypherGate/cyphergated"

  cp -r "Assets" "$pkgdir/opt/CypherGate/"

  # desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/CypherGate.desktop" <<EOF
[Desktop Entry]
Name=CypherGate VPN
Exec=/opt/CypherGate/cyphergate
Icon=/opt/CypherGate/Assets/icon.png
Type=Application
Categories=Network;Utility;
EOF

  # systemd service
  install -d "$pkgdir/usr/lib/systemd/system"
  cat >"$pkgdir/usr/lib/systemd/system/cyphergated.service" <<EOF
[Unit]
Description=CypherGate Root Daemon
After=network.target

[Service]
ExecStart=/opt/CypherGate/cyphergated
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF
}
