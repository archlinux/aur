# Maintainer: Cypher-Monarch <monarchcypher@gmail.com>

pkgname=cyphergatevpn-bin
pkgver=2.1.2
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
  'bae4919f95c4f80b6814e1aecb2bdf5ccc72aac85f4789a880fa16940a2210d1'
  'a6432c857610504791ef912a682920f55dbdd5daf863cb2b4b331e40888d00ee'
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

  install -d "$pkgdir/usr/share/cyphergate/themes"
  cp -r "themes/." "$pkgdir/usr/share/cyphergate/themes/"

  cp -r "assets" "$pkgdir/opt/CypherGate/"

  # desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/CypherGate.desktop" <<EOF
[Desktop Entry]
Name=CypherGate VPN
Exec=/opt/CypherGate/cyphergate
Icon=/opt/CypherGate/assets/icon.png
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
KillMode=control-group

User=root
Group=cyphergate

RuntimeDirectory=cyphergate
RuntimeDirectoryMode=2750

NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
}
