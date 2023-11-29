pkgname=node-hp-scan-to
pkgver=1.4.2
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
sha512sums=('57cca8b645c9f4172a309ac0a2a300892224e6c612ae837db0691c3e41337ba3088dec9fb751aeb994125ae23cdfa77ec643812b291d7b63646866b00f47852c')

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
