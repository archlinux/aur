# SPDX-License-Identifier: AGPL-3.0-or-later
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=sharkfin
pkgver=0.8.0
pkgrel=1
pkgdesc='Messaging over MCP for agent/human development teams'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Sharkfin'
license=('AGPL-3.0-or-later')
makedepends=('go' 'nodejs' 'pnpm')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b2f4207e8508850f7191d0184f8adefa006d47ca12a42b9809d7605448ec7108')

build() {
    cd "Sharkfin-${pkgver}"

    # Build web UI first — go:embed requires dist/ to exist.
    (cd web && pnpm install --frozen-lockfile && pnpm build)

    # Build Go binary with embedded UI.
    export CGO_ENABLED=0
    go build -tags ui -trimpath \
        -ldflags "-s -w -X github.com/Work-Fort/sharkfin/cmd.Version=v${pkgver}" \
        -o sharkfin
}

check() {
    cd "Sharkfin-${pkgver}"
    CGO_ENABLED=0 go test ./...
}

package() {
    cd "Sharkfin-${pkgver}"
    install -Dm755 sharkfin "${pkgdir}/usr/bin/sharkfin"
    install -Dm644 dist/sharkfin.system.service "${pkgdir}/usr/lib/systemd/user/sharkfin.service"
}
