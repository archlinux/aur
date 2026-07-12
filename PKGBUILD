# Maintainer: RiverOnVenus <aur@zhui.dev>
pkgname=agentsight
pkgver=0.2.43
pkgrel=1
pkgdesc="eBPF-based observability for AI agent sessions, prompts, process trees, files, network activity, and token usage"
arch=('x86_64')
url="https://github.com/eunomia-bpf/agentsight"
license=('MIT')
depends=('glibc' 'zstd' 'sqlite3')
makedepends=('cargo')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/eunomia-bpf/agentsight/archive/refs/tags/v${pkgver}.tar.gz"
    'system-libsqlite3.patch'
)
sha256sums=(
    '67a5c76ea74a4f9d90bae4a17a311873fc55b0ace6054f516398f3dc8ff70341'
    'c62f44ced9b65fd1b73a1eb72d0239164082b568dcf23a69ece0a4e9e07fc250'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/system-libsqlite3.patch"
    cd collector
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}/collector"
    # Force zstd-sys to use system libzstd via pkg-config
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}/collector"
    export ZSTD_SYS_USE_PKG_CONFIG=1
    # export_snapshot_test assumes changing HOME overrides dirs::home_dir(),
    # which is not true for Unix users resolved through the account database.
    cargo test --frozen --release --bins
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "collector/target/release/agentsight" -t "${pkgdir}/usr/bin/"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
