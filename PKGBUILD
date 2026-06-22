# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-git
pkgver=r2046.cf59404
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
provides=('calagopus-panel')
conflicts=('calagopus-panel-bin' 'calagopus-panel-aio-bin')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm' 'git')

source=('calagopus-panel::git+https://github.com/calagopus/panel.git')
sha256sums=('SKIP')

pkgver() {
    cd "calagopus-panel"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "calagopus-panel/frontend"
    pnpm install
    pnpm build:ci
    cd ..
    cargo build --release --locked
}

package() {
    cd "calagopus-panel"
    install -Dm755 "target/release/panel" "${pkgdir}/usr/bin/calagopus-panel"
}
