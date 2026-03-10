# Maintainer: Corey Watson <cw@limehawk.io>
pkgname=omarchy-vpn
pkgver=0.1.1
pkgrel=1
pkgdesc="WireGuard VPN manager TUI for Omarchy"
arch=('x86_64')
url="https://github.com/limehawk/omarchy-vpn"
license=('MIT')
depends=('wireguard-tools' 'systemd-resolvconf')
makedepends=('go')
install=omarchy-vpn.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/omarchy-vpn/archive/v$pkgver.tar.gz")
sha256sums=('ae2688e56eda12b61a76c103cb87eff2b89ffc943d413f30d977c7b113ea682f')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"

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
