# Maintainer: deungjaho <deungjaho@gmail.com>
pkgname=hydra-proxy
pkgver=0.4.8
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
sha256sums=('7675a7744024ff3c349b2876a3b2930b3326e0d3d9a2d2fb9d4d245406e9cacf')

build() {
    cd "${srcdir}/hydra-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -o hydra ./cmd/hydra
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
