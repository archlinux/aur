# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=omarchy-vpn
pkgver=0.4.5
pkgrel=2
pkgdesc="WireGuard VPN manager TUI for Omarchy"
arch=('x86_64')
url="https://github.com/limehawk/omarchy-vpn"
license=('MIT')
depends=('wireguard-tools' 'systemd-resolvconf')
optdepends=('netbird: NetBird mesh VPN row'
            'cloudflare-warp-bin: Cloudflare WARP row')
makedepends=('go' 'git')
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

    # Sudoers for passwordless WireGuard management
    install -Dm440 /dev/stdin "$pkgdir/etc/sudoers.d/$pkgname" << 'EOF'
%wheel ALL=(ALL) NOPASSWD: /usr/bin/wg-quick up *
%wheel ALL=(ALL) NOPASSWD: /usr/bin/wg-quick down *
%wheel ALL=(ALL) NOPASSWD: /usr/bin/wg show *
%wheel ALL=(ALL) NOPASSWD: /usr/bin/ls /etc/wireguard
%wheel ALL=(ALL) NOPASSWD: /usr/bin/cat /etc/wireguard/*.conf
%wheel ALL=(ALL) NOPASSWD: /usr/bin/cp * /etc/wireguard/*.conf
%wheel ALL=(ALL) NOPASSWD: /usr/bin/chmod 600 /etc/wireguard/*.conf
%wheel ALL=(ALL) NOPASSWD: /usr/bin/mv /etc/wireguard/*.conf /etc/wireguard/*.conf
%wheel ALL=(ALL) NOPASSWD: /usr/bin/rm /etc/wireguard/*.conf
EOF

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
