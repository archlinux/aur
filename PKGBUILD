# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=omarchy-vpn
pkgver=0.4.9
pkgrel=1
pkgdesc="WireGuard VPN manager TUI for Omarchy"
arch=('x86_64')
url="https://github.com/limehawk/omarchy-vpn"
license=('MIT')
depends=('wireguard-tools' 'systemd-resolvconf')
optdepends=('netbird: NetBird mesh VPN row'
            'cloudflare-warp-bin: Cloudflare WARP row')
makedepends=('go' 'git')
options=('!debug')  # binary is built with -s -w; a debug package would be empty
install=omarchy-vpn.install
source=("$pkgname::git+https://github.com/limehawk/omarchy-vpn.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    export CGO_ENABLED=0
    go build -ldflags="-s -w -X main.version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname"

    # Binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Root helper: the only command sudo allows. It takes config names,
    # never paths, and refuses imports that carry root hook commands.
    install -Dm755 omarchy-vpn-helper "$pkgdir/usr/lib/$pkgname/helper"

    # Sudoers for passwordless WireGuard management (dir mode matches the sudo package)
    install -dm750 "$pkgdir/etc/sudoers.d"
    install -Dm440 /dev/stdin "$pkgdir/etc/sudoers.d/$pkgname" << 'EOF'
%wheel ALL=(root) NOPASSWD: /usr/lib/omarchy-vpn/helper
# The TUI and bar widget poll these read-only calls every few seconds; don't
# let sudo log each one. Changes and refusals are still logged, by sudo and
# by the helper's own audit (journalctl -t omarchy-vpn).
Cmnd_Alias OMARCHY_VPN_READ = /usr/lib/omarchy-vpn/helper list, /usr/lib/omarchy-vpn/helper interfaces, /usr/lib/omarchy-vpn/helper show *, /usr/lib/omarchy-vpn/helper cat *
Defaults!OMARCHY_VPN_READ !log_allowed, !pam_session
EOF

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
