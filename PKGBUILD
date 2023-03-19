pkgname=node-hp-scan-to
pkgver=1.3.0
pkgrel=2
pkgdesc="Allow to send scan from HP All-in-One Printer to computer"
arch=(any)
url="https://github.com/manuc66/node-hp-scan-to"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('a2e10830bbed2572633f21c336ef586d82f5b69b81e63d285ab651b903a2643e7203dc90ead90e3388145052a0a8c94ba7ed1f96021a0bd3f443fe021ad25dc4')

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

}

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"

    install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    echo "Please enable the systemd service via 'sudo systemctl enable --now $pkgname.service"
}
