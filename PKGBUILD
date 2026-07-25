# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=tmux-claude-monitor
pkgver=0.1.11
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
sha256sums=('60eaa0b58ffd1e2270be4f17ab7751e03e4ee3b29165f6d92d37fa9cae411951')

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
