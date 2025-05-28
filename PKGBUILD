pkgname=node-hp-scan-to
pkgver=1.8.0
pkgrel=0
pkgdesc="Little command line program that allow to send scan from device to computer. For this purpose, the original HP Windows application's interaction with the device has been reverse engineered."
arch=(any)
url="https://github.com/manuc66/node-hp-scan-to"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
backup=('etc/node-hp-scan-to/default.json')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=(b07b69769219fc8c3656a6f3d80c612e0aa7b1ff4a54c593f55138a2f8b139bb21755c7e9479a256511ff005d59070080c00472836c090b825f9adc47d5ed96f)

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
