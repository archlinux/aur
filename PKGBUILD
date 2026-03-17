# SPDX-License-Identifier: Apache-2.0
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=workfort
pkgver=0.3.0
pkgrel=1
pkgdesc='WorkFort web and TUI frontend'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Scope'
license=('Apache-2.0')
depends=()
makedepends=('go' 'nodejs' 'pnpm')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e9c11a1c17ba2d88440ac36d5d6f88cb2e1a234e2da483ed473a8f1efc03319')

build() {
    cd "Scope-${pkgver}"

    # Install and build all web packages (ui, adapters, shell)
    (cd web && pnpm install --frozen-lockfile && pnpm build)

    # Stage shell SPA for Go embed
    rm -rf cmd/web/dist
    cp -r web/shell/dist cmd/web/dist

    # Build Go binary with embedded SPA
    export CGO_ENABLED=0
    _ver="${pkgver}-aur"
    go build -tags spa -trimpath -ldflags "-s -w -X github.com/Work-Fort/Scope/cmd.Version=${_ver}" -o workfort .
}

check() {
    cd "Scope-${pkgver}"
    CGO_ENABLED=0 go test ./...
}

package() {
    cd "Scope-${pkgver}"
    install -Dm755 workfort "${pkgdir}/usr/bin/workfort"
}
