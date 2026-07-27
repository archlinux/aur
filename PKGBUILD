# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=tmux-claude-monitor-bin
pkgver=0.4.0
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
sha256sums_x86_64=('eb007ecceeff9ddc472b988106f79053a8757629808dba65ec2d5dd53082bd2d')
sha256sums_aarch64=('155a723ba3f044abe73ee129c8edea60d4a475aef5323c59ceab08f7c5aa2177')

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
