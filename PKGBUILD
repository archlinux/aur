# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=2026.03.10-165737
_pkgtag=2026.03.10-165737
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy Agent - Runs on target devices for remote debugging and deployment"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy-agent')
conflicts=('wendy-agent-git')
depends=('containerd' 'dbus' 'systemd' 'ca-certificates')
optdepends=(
    'networkmanager: Wi-Fi support via NetworkManager'
    'connman: Wi-Fi support via ConnMan'
    'bluez: Bluetooth support'
)
backup=('etc/wendy-agent/config.json' 'etc/default/wendy-agent')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-agent-linux-amd64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-agent-linux-arm64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('652f5e0efba513e67f413a47dd10c16c06b61216c4166806b8da4fcb02f01833')
sha256sums_aarch64=('d4a385004cf8581d11d0b2e7aca499308a0738f0a2fe3a3e438a3efc994cd512')

package() {
    cd "${srcdir}"

    # Find the extracted directory and install binary
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-agent-linux-amd64/wendy-agent" "${pkgdir}/usr/bin/wendy-agent"
    else
        install -Dm755 "wendy-agent-linux-arm64/wendy-agent" "${pkgdir}/usr/bin/wendy-agent"
    fi

    # Create config and storage directories
    install -dm755 "${pkgdir}/etc/wendy-agent"
    install -dm755 "${pkgdir}/var/lib/wendy-agent/storage"
    install -dm755 "${pkgdir}/usr/lib/systemd/system"
    install -dm755 "${pkgdir}/etc/default"

    # Create placeholder config file so pacman backup semantics work on upgrades.
    printf "{}\n" > "${pkgdir}/etc/wendy-agent/config.json"
    chmod 600 "${pkgdir}/etc/wendy-agent/config.json"

    # Service environment defaults (override per-host as needed).
    # NOTE: keep this in sync with packaging/linux/default/wendy-agent.
    # We inline it here because AUR packages only ship PKGBUILD/.SRCINFO.
    cat > "${pkgdir}/etc/default/wendy-agent" <<'EOF'
# Environment overrides for wendy-agent.
WENDY_SYSTEMD_SERVICE_NAME=wendy-agent

# Network manager selection options:
# auto, connman, networkmanager, force-connman, force-networkmanager
# WENDY_NETWORK_MANAGER=auto
EOF
    chmod 644 "${pkgdir}/etc/default/wendy-agent"

    # Systemd unit
    # NOTE: keep this in sync with packaging/linux/systemd/wendy-agent.service.
    # We inline it here because AUR packages only ship PKGBUILD/.SRCINFO.
    cat > "${pkgdir}/usr/lib/systemd/system/wendy-agent.service" <<'EOF'
[Unit]
Description=Wendy Agent
After=network-online.target dbus.service containerd.service
Wants=network-online.target
Requires=containerd.service

[Service]
Type=simple
EnvironmentFile=-/etc/default/wendy-agent
WorkingDirectory=/var/lib/wendy-agent
ExecStart=/usr/bin/wendy-agent
Restart=always
RestartSec=2
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF
    chmod 644 "${pkgdir}/usr/lib/systemd/system/wendy-agent.service"
}
