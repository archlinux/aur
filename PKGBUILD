pkgname=companion-satellite
pkgver=3.7.0
pkgrel=1
pkgdesc='Bitfocus Companion Satellite - connects local Stream Decks to a remote Companion instance'
arch=('x86_64')
url='https://github.com/bitfocus/companion-satellite'
license=('MIT')
depends=('nodejs' 'libusb' 'hidapi' 'fontconfig' 'systemd-libs')
makedepends=('nodejs>=24' 'corepack' 'python' 'gcc' 'make' 'pkg-config')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitfocus/companion-satellite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e04c0b178ea32992dbff5a3179620e3601f0dd2ec29cea806a7ab827105bb99')

build() {
    cd "${pkgname}-${pkgver}"
    export COREPACK_HOME="${srcdir}/.corepack"
    export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    corepack yarn install --immutable
    corepack yarn build
    corepack yarn tsx --eval "import('./tools/build_thread.mts').then((m) => m.buildSurfaceThreadEntrypoint())"
    corepack yarn workspaces focus --production satellite
}

package() {
    cd "${pkgname}-${pkgver}"

    local dest="${pkgdir}/opt/${pkgname}"
    install -dm755 "${dest}/satellite" "${dest}/webui" "${dest}/node-runtimes"

    cp -a satellite/dist "${dest}/satellite/dist"
    cp -a satellite/assets "${dest}/satellite/assets"
    cp satellite/package.json "${dest}/satellite/package.json"
    cp -a node_modules "${dest}/satellite/node_modules"
    cp -a webui/dist "${dest}/webui/dist"
    cp -a assets "${dest}/assets"
    cp satellite/assets/icon.png "${dest}/assets/icon.png"
    cp -a .cache/builtin-surfaces "${dest}/modules"

    local name version
    while IFS=$'\t' read -r name version; do
        cp -a ".cache/node-runtime/linux-x64-${version}" "${dest}/node-runtimes/${name}"
    done < <(node -e 'for (const [k, v] of Object.entries(require("./assets/nodejs-versions.json"))) console.log(`${k}\t${v}`)')

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
exec node /opt/companion-satellite/satellite/dist/main.js "$CONFIG_FILE" "$@"
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
