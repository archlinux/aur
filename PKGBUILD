# SPDX-License-Identifier: Apache-2.0
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=workfort
pkgver=0.5.2
pkgrel=1
pkgdesc='WorkFort service shell and proxy'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Scope'
license=('Apache-2.0')
depends=('sqlite')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm' 'pkg-config')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b311afa07d23e25afdbe44edceaef9084a05fe5ab9f6e61957807036ca3a3f6d')

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
