# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=tmux-claude-monitor-bin
pkgver=0.5.2
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
sha256sums_x86_64=('b3d8433c2d27b07b1070e1e9784f1eee5262a7839a1a6d636f6ede964ded16ed')
sha256sums_aarch64=('278a643d5a539346d53c268d35774ae0292d64c4795c2e298d342f2cb2a80d35')

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
