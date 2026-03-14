pkgname=companion-satellite
pkgver=2.8.0
pkgrel=3
pkgdesc='Bitfocus Companion Satellite - connects local Stream Decks to a remote Companion instance'
arch=('x86_64')
url='https://github.com/bitfocus/companion-satellite'
license=('MIT')
depends=('nodejs' 'libusb' 'hidapi')
makedepends=('nodejs>=24' 'corepack' 'python' 'gcc' 'make' 'pkg-config')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitfocus/companion-satellite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export COREPACK_HOME="${srcdir}/.corepack"
    corepack yarn install --immutable
    corepack yarn build
}

package() {
    cd "${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a satellite/dist "${pkgdir}/opt/${pkgname}/dist"
    cp -a satellite/assets "${pkgdir}/opt/${pkgname}/assets"
    cp satellite/package.json "${pkgdir}/opt/${pkgname}/package.json"
    cp -a node_modules "${pkgdir}/opt/${pkgname}/node_modules"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/bin/bash
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/companion-satellite"
CONFIG_FILE="${CONFIG_DIR}/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    mkdir -p "$CONFIG_DIR"
    cat > "$CONFIG_FILE" << 'EOF'
{
    "remoteProtocol": "tcp",
    "remoteIp": "127.0.0.1",
    "remotePort": 16622
}
EOF
fi
NODE_PATH=/opt/companion-satellite/node_modules exec node /opt/companion-satellite/dist/main.js "$CONFIG_FILE" "$@"
LAUNCHER

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/${pkgname}.service" << EOF
[Unit]
Description=Companion Satellite
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/usr/bin/${pkgname}
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

    install -Dm644 satellite/assets/linux/50-satellite.rules \
        "${pkgdir}/usr/lib/udev/rules.d/50-${pkgname}.rules"

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf" << 'EOF'
g satellite - -
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
