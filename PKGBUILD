# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Qwen 3.6 (Alibaba).

pkgname=wg-portal
pkgver=2.2.3
pkgrel=1
pkgdesc="Web-based WireGuard VPN configuration portal with user management"
arch=('x86_64' 'aarch64')
url="https://github.com/h44z/wg-portal"
license=('MIT')
depends=('wireguard-tools')
makedepends=('go' 'pnpm' 'nodejs')
optdepends=(
    'iptables: for NAT/firewall rules'
    'nftables: for NAT/firewall rules (alternative to iptables)'
)
options=('!debug')
backup=('etc/wg-portal/config.yml')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/h44z/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "config.yml"
)
b2sums=(
    '6a0c9f49fcb9aa5cc6e5177889c15b23671db73dbdf43c65670ebbbcd462d8f27dcb4e4bf30260b9adb2f8b066e8987d38c55d6c24b592b4bbc86f4787c94c59'
    '894b53b5e5a059f49340c7e470f3b4a1355c1545b7fe1bb86e2a026fcbf81802fdae6ba24200c3154a168c9899b498e3375730f5412f65e9967c020c908e604a'
    '560839a9344c23531d5e94faeb40cb793275254175c43b5f66e2d980ce7a3a2cd7a26df8f62e6353496ceca6dd7dd4dbde7be9daaa085094b61b9f6fee91d849'
)

prepare() {
    cd "${pkgname}-${pkgver}"

    # Build frontend assets
    cd frontend
    pnpm install --no-frozen-lockfile
    pnpm build
    cd ..

    # Download Go dependencies
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_ENABLED=0

    go build \
        -trimpath \
        -ldflags "-w -s -X 'github.com/h44z/wg-portal/internal.Version=v${pkgver}'" \
        -tags netgo \
        -o dist/wg-portal \
        cmd/wg-portal/main.go
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binary
    install -Dm755 dist/wg-portal "${pkgdir}/usr/bin/wg-portal"

    # License
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Default config
    install -Dm640 "${srcdir}/config.yml" \
        "${pkgdir}/etc/wg-portal/config.yml"

    # systemd service
    install -Dm644 "${srcdir}/${pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

post_install() {
    echo ""
    echo "  WireGuard Portal installed."
    echo ""
    echo "  REQUIRED: edit /etc/wg-portal/config.yml before starting:"
    echo "    - core.admin_password  (minimum 16 characters)"
    echo "    - web.external_url     (your server's public URL)"
    echo ""
    echo "  Generate a strong password:  openssl rand -base64 16"
    echo ""
    echo "  Then:  systemctl enable --now wg-portal"
    echo ""
}
