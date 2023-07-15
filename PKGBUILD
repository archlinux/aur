pkgname=node-hp-scan-to
pkgver=1.3.1
pkgrel=1
pkgdesc="Allow to send scan from HP All-in-One Printer to computer"
arch=(any)
url="https://github.com/manuc66/node-hp-scan-to"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
backup=('etc/node-hp-scan-to/default.json')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('bf911d268c8b8c688edb673a058ba09f8eb1001e05ae5a33333bbb4dd2e587f0b7005d1468d88d4f1cee4e1eb5ac18443d0fe1feb72cf7f1ad06ccacd654ff0f')

build() {
    cat > "$srcdir/$pkgname.service" <<EOF
[Unit]
Description=Receive scan from HP All-in-One printers
After=syslog.target network-online.target

[Service]
Type=simple
User=root
Environment=NODE_CONFIG_DIR=/etc/node-hp-scan-to
WorkingDirectory=/usr/bin/
ExecStart=/usr/bin/node-hp-scan-to
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
EOF
    cat > "$srcdir/default.json" <<EOF
{
  "debug": false
}
EOF

}

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"

    install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    echo "Please enable the systemd service via 'sudo systemctl enable --now $pkgname.service'"

    install -d "$pkgdir"/etc/node-hp-scan-to
    install -m644 "$srcdir"/default.json "$pkgdir"/etc/node-hp-scan-to/default.json
}
