# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=2026.03.16-023243
_pkgtag=2026.03.16-023243
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy Agent - Runs on target devices for remote debugging and deployment"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy-agent')
conflicts=('wendy-agent-git')
depends=('containerd' 'xdg-dbus-proxy' 'dbus' 'systemd' 'ca-certificates')
optdepends=(
    'nerdctl: CLI for managing containerd containers'
    'networkmanager: Wi-Fi support via NetworkManager'
    'connman: Wi-Fi support via ConnMan'
    'bluez: Bluetooth support'
)
backup=('etc/wendy-agent/config.json' 'etc/default/wendy-agent')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-agent-linux-amd64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-agent-linux-arm64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('48512b2522b5d02177a36f44b608aa3ca87c154a15899d30e1c32ff3bc53385a')
sha256sums_aarch64=('4a1fe7a4e710ddab92a22d1b16b818d5e4e95b07fd103d1dcb42db757d5c09e1')

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
