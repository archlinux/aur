# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>

pkgname=mcpproxy-bin
pkgver=0.27.1 # renovate: datasource=github-tags depName=smart-mcp-proxy/mcpproxy-go
pkgrel=1
pkgdesc="Smart proxy for AI agents using the Model Context Protocol"
arch=('x86_64')
url="https://github.com/smart-mcp-proxy/mcpproxy-go"
license=('MIT')
backup=('etc/mcpproxy/mcp_config.json')
optdepends=('systemd: run the bundled mcpproxy.service system unit')
provides=('mcpproxy')
conflicts=('mcpproxy')
options=('!strip')
source=(
  "mcpproxy-${pkgver}-linux-amd64.tar.gz::https://github.com/smart-mcp-proxy/mcpproxy-go/releases/download/v${pkgver}/mcpproxy-${pkgver}-linux-amd64.tar.gz"
  "mcp_config.json.example::https://raw.githubusercontent.com/smart-mcp-proxy/mcpproxy-go/v${pkgver}/packaging/linux/mcp_config.json.example"
  "LICENSE::https://raw.githubusercontent.com/smart-mcp-proxy/mcpproxy-go/v${pkgver}/LICENSE"
)
sha256sums=(
  'd2a35cbdd62de85f2b05513056611138283e2900e9c9b15651c2c409ec23152a'
  'f07d24f77cf4e69feec20282ff443fe1f83607495b1d03d0306342b00ddb1a61'
  '897cd80d344a5570fcd3526834fffdb0b9bd8087632455dd393f5f2d43c94d47'
)

package() {
  install -Dm755 "$srcdir/mcpproxy" \
    "$pkgdir/usr/bin/mcpproxy"

  install -dm755 "$pkgdir/usr/lib/systemd/system"
  printf '%s\n' \
    '[Unit]' \
    'Description=MCPProxy - Smart proxy for AI agents using Model Context Protocol' \
    'Documentation=https://mcpproxy.app https://github.com/smart-mcp-proxy/mcpproxy-go' \
    'After=network-online.target' \
    'Wants=network-online.target' \
    '' \
    '[Service]' \
    'Type=simple' \
    'DynamicUser=yes' \
    'StateDirectory=mcpproxy' \
    'ConfigurationDirectory=mcpproxy' \
    'ExecStart=/usr/bin/mcpproxy serve --config=/etc/mcpproxy/mcp_config.json --data-dir=/var/lib/mcpproxy' \
    'Restart=on-failure' \
    'RestartSec=5s' \
    'NoNewPrivileges=true' \
    'ProtectSystem=strict' \
    'ProtectHome=true' \
    'PrivateTmp=true' \
    'PrivateDevices=true' \
    'ProtectKernelTunables=true' \
    'ProtectKernelModules=true' \
    'ProtectControlGroups=true' \
    'RestrictSUIDSGID=true' \
    'LockPersonality=true' \
    'AmbientCapabilities=CAP_NET_BIND_SERVICE' \
    'CapabilityBoundingSet=CAP_NET_BIND_SERVICE' \
    'Environment=HOME=/var/lib/mcpproxy' \
    'Environment=HEADLESS=1' \
    '' \
    '[Install]' \
    'WantedBy=multi-user.target' \
    > "$pkgdir/usr/lib/systemd/system/mcpproxy.service"

  install -Dm644 "$srcdir/mcp_config.json.example" \
    "$pkgdir/etc/mcpproxy/mcp_config.json.example"
  install -Dm644 "$srcdir/mcp_config.json.example" \
    "$pkgdir/etc/mcpproxy/mcp_config.json"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
