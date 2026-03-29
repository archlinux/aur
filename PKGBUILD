# Maintainer: Elchi-dev <https://github.com/Elchi-dev>
# AUR package for Onyx — modular reverse proxy with a live dashboard
# https://aur.archlinux.org/packages/onyx

pkgname=onyx
pkgver=0.1.1
pkgrel=1
pkgdesc="Modular reverse proxy with a live WebSocket dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/Elchi-dev/onyx"
license=('MIT')
depends=()
makedepends=('go')
backup=('etc/onyx/onyx.toml')
install=onyx.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Elchi-dev/onyx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags "-s -w -X main.version=v${pkgver}" -o onyx ./cmd/onyx
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binary
    install -Dm755 onyx "${pkgdir}/usr/bin/onyx"

    # Systemd service
    install -Dm644 onyx.service "${pkgdir}/usr/lib/systemd/system/onyx.service"

    # Example config
    install -Dm644 onyx.example.toml "${pkgdir}/etc/onyx/onyx.example.toml"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
