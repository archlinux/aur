# SPDX-License-Identifier: Apache-2.0
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=workfort
pkgver=0.2.0
pkgrel=1
pkgdesc='WorkFort web and TUI frontend'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Scope'
license=('Apache-2.0')
depends=()
makedepends=('go' 'nodejs' 'pnpm')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f61fe7f46d5b4d8b8fc135e14ff2401284cafa1b536f2af47f2b1baee5bd6dec')

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
