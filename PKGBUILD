# Maintainer: RiverOnVenus <aur@zhui.dev>
pkgname=agentsight
pkgver=1.0.31
pkgrel=1
pkgdesc="eBPF-based observability for AI agent sessions, prompts, process trees, files, network activity, and token usage"
arch=('x86_64')
url="https://github.com/eunomia-bpf/agentsight"
license=('MIT')
depends=('glibc' 'zstd' 'sqlite3')
makedepends=('cargo')
# rust-lld, the default linker since rustc 1.90, cannot read the GCC LTO
# objects the `lto` makepkg option injects into CFLAGS, which breaks ring.
options=('!lto')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/eunomia-bpf/agentsight/archive/refs/tags/v${pkgver}.tar.gz"
    'system-libsqlite3.patch'
)
sha256sums=(
    '249842b182bb9f0df9335e66defa77bc20ab17deb1bb6bb5d52c2d09dfd7e142'
    '9634b66ec7cb3384e2812000b4a3dcdf62bf01d7e28b93c8e85d85ffac563a08'
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
