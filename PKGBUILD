# Maintained upstream: this file is automatically updated and pushed to the
# AUR (aur.archlinux.org/packages/node-hp-scan-to) by .github/workflows/publish.yml
pkgname=node-hp-scan-to
pkgver=1.11.1
pkgrel=1
pkgdesc='Scan document to Computer for HP All-in-One Printers'
arch=(any)
url='https://github.com/manuc66/node-hp-scan-to'
license=(MIT)
depends=('nodejs>=20.11')
makedepends=(npm)
backup=('etc/node-hp-scan-to/default.json')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('6b58dd4eb7f54e7a9b22e1f2b5524eeca0c4ad1bfc473ae5125f43309ebe5c07')

prepare() {
    cat > "${srcdir}/${pkgname}.service" <<EOF
[Unit]
Description=Scan document to Computer for HP All-in-One Printers
Documentation=https://github.com/manuc66/node-hp-scan-to
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
Environment=NODE_CONFIG_DIR=/etc/node-hp-scan-to
ExecStart=/usr/bin/node-hp-scan-to listen --health-check
Restart=on-failure
RestartSec=10
KillMode=process
DynamicUser=yes
StateDirectory=${pkgname}
NoNewPrivileges=yes
PrivateTmp=yes
ProtectSystem=full
ProtectHome=read-only
ProtectKernelTunables=yes
ProtectKernelModules=yes
ProtectKernelLogs=yes
ProtectControlGroups=yes
RestrictSUIDSGID=yes
LockPersonality=yes
RestrictNamespaces=yes
CapabilityBoundingSet=

[Install]
WantedBy=multi-user.target
EOF

    cat > "${srcdir}/${pkgname}-user.service" <<EOF
[Unit]
Description=Scan document to Computer for HP All-in-One Printers (per user)
Documentation=https://github.com/manuc66/node-hp-scan-to
After=network-online.target

[Service]
Type=simple
Environment=NODE_CONFIG_DIR=%h/.config/node-hp-scan-to
ExecStart=/usr/bin/node-hp-scan-to listen --health-check
Restart=on-failure
RestartSec=5
NoNewPrivileges=yes
PrivateTmp=yes

[Install]
WantedBy=default.target
EOF

    cat > "${srcdir}/default.json" <<EOF
{
  "debug": false
}
EOF
}

build() {
    cd package
    npm install --omit=dev --no-audit --no-fund --ignore-scripts
}

check() {
    cd package
    node dist/index.js --help >/dev/null
}

package() {
    cd package

    install -dm755 "${pkgdir}/usr/lib/node-hp-scan-to"
    cp -a dist "${pkgdir}/usr/lib/node-hp-scan-to/dist"
    cp -a node_modules "${pkgdir}/usr/lib/node-hp-scan-to/node_modules"
    install -Dm644 package.json "${pkgdir}/usr/lib/node-hp-scan-to/package.json"

    # tsc emits non-executable files; restore the exec bit required by the shebang
    chmod +x "${pkgdir}/usr/lib/node-hp-scan-to/dist/index.js"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/node-hp-scan-to/dist/index.js "${pkgdir}/usr/bin/node-hp-scan-to"

    install -Dm0644 "${srcdir}/${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm0644 "${srcdir}/${pkgname}-user.service" \
        "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    install -d "${pkgdir}/etc/node-hp-scan-to"
    install -m644 "${srcdir}/default.json" \
        "${pkgdir}/etc/node-hp-scan-to/default.json"
}
