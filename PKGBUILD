# Maintainer: Cypher-Monarch <monarchcypher@gmail.com>

pkgname=cyphergatevpn-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="CypherGate VPN binary release"
arch=('x86_64')
url="https://github.com/Cypher-Monarch/CypherGate"
license=('GPL-3.0')
depends=('openvpn' 'bind')
provides=('cyphergate-vpn')
conflicts=('cyphergate-vpn')
options=('!debug')

source=(
  "CypherGate-Linux-v${pkgver}.tar.xz::https://github.com/Cypher-Monarch/CypherGate/releases/download/v${pkgver}/CypherGate-Linux-v${pkgver}.tar.xz"
  "CypherGate-Linux-v${pkgver}.tar.xz.sig::https://github.com/Cypher-Monarch/CypherGate/releases/download/v${pkgver}/CypherGate-Linux-v${pkgver}.tar.xz.sig"
)

sha256sums=(
  'ae81c871a36185d8907a2b3bdb34fca317f059c506102bbce33b8fe0e2a6572c'
  '56881adae79ec770293db35f62c6c0e07bf31f1f9dd06678d25c33d3a83befc7'
)

validpgpkeys=(
  '9ED87F6065033606670941AAC6C9B498797C980E'
)

install=cyphergatevpn-bin.install

package() {
  cd "$srcdir/CypherGate-Linux-v$pkgver"

  # /opt install
  install -d "$pkgdir/opt/CypherGate"
  install -d "$pkgdir/usr/bin"
  install -Dm755 "cyphergate.elf" "$pkgdir/opt/CypherGate/cyphergate"
  install -Dm755 "cyphergated.elf" "$pkgdir/opt/CypherGate/cyphergated"
  ln -s "/opt/CypherGate/cyphergate" "$pkgdir/usr/bin/cyphergate"

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
Type=simple
ExecStart=/opt/CypherGate/cyphergated
Restart=always

User=root
Group=cyphergate

RuntimeDirectory=cyphergate
RuntimeDirectoryMode=0750

NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
}
