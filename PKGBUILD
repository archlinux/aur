# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=tmux-claude-monitor-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="tmux status bar daemon displaying Claude Pro quota usage in real time (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/tedwardd/tmux-claude-monitor"
license=('MIT')
provides=('claude-monitor')
conflicts=('tmux-claude-monitor')
install=claude-monitor.install
source_x86_64=("claude-monitor-${pkgver}-x86_64.tar.gz::https://github.com/tedwardd/tmux-claude-monitor/releases/download/v${pkgver}/claude-monitor_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("claude-monitor-${pkgver}-aarch64.tar.gz::https://github.com/tedwardd/tmux-claude-monitor/releases/download/v${pkgver}/claude-monitor_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('870567cb05fb63af4601c2108d4886af88d6da3861a2fd22eca9d5899cea4235')
sha256sums_aarch64=('53a056cea0c491464ba4ec24a06704757fd11d3691c17433902fce1470ac6499')

package() {
    install -Dm755 "${srcdir}/claude-monitor" "${pkgdir}/usr/bin/claude-monitor"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
