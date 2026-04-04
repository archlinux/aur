# SPDX-License-Identifier: Apache-2.0
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=workfort
pkgver=0.5.1
pkgrel=1
pkgdesc='WorkFort service shell and proxy'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Scope'
license=('Apache-2.0')
depends=('sqlite')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm' 'pkg-config')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0bb46a4b89bf73ad3617dc8a36b39de0527d05b8d4a1bafb0770bbd7a2408b88')

build() {
    cd "Scope-${pkgver}"

    # Remove mise.toml to avoid tool version conflicts
    rm -f mise.toml

    # Build shell SPA
    (cd web && pnpm install --frozen-lockfile && pnpm --filter ./shell build)

    # Build Rust binary
    cargo build --release --package scope-server
}

check() {
    cd "Scope-${pkgver}"
    cargo test --workspace
}

package() {
    cd "Scope-${pkgver}"
    install -Dm755 target/release/scope-server "${pkgdir}/usr/bin/workfort"
}
