# Maintainer: deungjaho <deungjaho@gmail.com>
# PKGBUILD for hydra-proxy AUR package
# 规范流程见 hydra/aur/README.md

pkgname=hydra-proxy
pkgver=0.8.0
pkgrel=1
pkgdesc="Terminal AI proxy gateway for Antigravity accounts (OpenAI/Anthropic-compatible)"
arch=('x86_64')
url="https://github.com/deungjaho/hydra"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('hydra')
conflicts=('hydra' 'hydra-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deungjaho/hydra/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(dc107e39ea2e28e4962009ccc18bbbd54bb745801b85b4f8a55f1d3e80914841)

build() {
    cd "${srcdir}/hydra-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w -X github.com/deungjaho/hydra/internal/cli.Version=${pkgver} -X github.com/deungjaho/hydra/internal/cli.Commit=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)" -o hydra ./cmd/hydra
}

check() {
    cd "${srcdir}/hydra-${pkgver}"
    go vet ./... 2>/dev/null || true
}

package() {
    cd "${srcdir}/hydra-${pkgver}"

    # Binary
    install -Dm755 hydra "${pkgdir}/usr/bin/hydra"

    # systemd user service
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/hydra.service" <<'SVC'
[Unit]
Description=Hydra Proxy (AI model gateway)
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/hydra serve
Restart=always
RestartSec=3
Environment=HOME=%h

[Install]
WantedBy=default.target
SVC

    # License (if present)
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
