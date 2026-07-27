# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=tmux-claude-monitor
pkgver=0.4.1
pkgrel=1
pkgdesc="tmux status bar daemon displaying Claude Pro quota usage in real time"
arch=('x86_64' 'aarch64')
url="https://github.com/tedwardd/tmux-claude-monitor"
license=('MIT')
makedepends=('go')
provides=('claude-monitor')
conflicts=('tmux-claude-monitor-bin')
install=claude-monitor.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tedwardd/tmux-claude-monitor/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('634a3af6a40500a806943522553892ac8cd30a56ea1345ca1f24a7b06281a654')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -trimpath -o claude-monitor -ldflags="-s -w" .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 claude-monitor "${pkgdir}/usr/bin/claude-monitor"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 /dev/null "${pkgdir}/usr/lib/systemd/user/claude-monitor.service"
    cat > "${pkgdir}/usr/lib/systemd/user/claude-monitor.service" << 'UNIT'
[Unit]
Description=Claude usage monitor
After=network.target
StartLimitIntervalSec=300
StartLimitBurst=5

[Service]
ExecStart=claude-monitor daemon
Restart=on-failure
RestartSec=30

[Install]
WantedBy=default.target
UNIT

    install -Dm644 /dev/null "${pkgdir}/usr/share/claude-monitor/config.json.default"
    cat > "${pkgdir}/usr/share/claude-monitor/config.json.default" << 'CONF'
{
  "poll_interval_seconds": 300,
  "cache_path": "~/.cache/claude-monitor/status.json",
  "credentials_path": "~/.claude/.credentials.json"
}
CONF
}
