# Maintainer: Cypher-Monarch <monarchcypher@gmail.com>

pkgname=cyphergatevpn-bin
pkgver=2.0.3
pkgrel=3
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
  '6d80a2e569ccc7ec66f25b2794b89bd33b3c11a8b3229dd2256052ee8f060489'
  '7d5beb36a5b026effd228a5f1d46b6c720c843ec4bab954d33c61c8875585b6d'
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
RuntimeDirectoryMode=2750

NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
}
