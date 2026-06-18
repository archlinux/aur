# Maintainer: RiverOnVenus <aur@zhui.dev>
pkgname=agentsight
pkgver=0.2.28
pkgrel=1
pkgdesc="eBPF-based observability for AI agent sessions, prompts, process trees, files, network activity, and token usage"
arch=('x86_64')
url="https://github.com/eunomia-bpf/agentsight"
license=('MIT')
depends=('glibc' 'zstd' 'sqlite3')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eunomia-bpf/agentsight/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e5bf8079c4d50a01f8605c9e63383b3186927fe962ec53b5a86a9e021ac059b')

prepare() {
    cd "${pkgname}-${pkgver}/collector"
    # Use system sqlite3 instead of bundled C compilation
    sed -i 's/rusqlite = { version = "0.32", features = \["bundled"\] }/rusqlite = { version = "0.32" }/' Cargo.toml
}

build() {
    cd "${pkgname}-${pkgver}/collector"
    # Force zstd-sys to use system libzstd via pkg-config
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "collector/target/release/agentsight" -t "${pkgdir}/usr/bin/"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
