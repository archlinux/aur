# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=eprofiler-tui
pkgver=0.3.0
_opentelemetry_ebpf_profiler_ref='3d56377fd84c840755842cc3c13dca3560cc5814'
_opentelemetry_proto_ref='7a9057485b350d3021400d4f1e60d768383ca42e'
pkgrel=1
pkgdesc='eBPF profiler flamegraph based TUI'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/rogercoll/eprofiler-tui'
license=('Apache-2.0')
makedepends=(
    'cargo'
    'cmake'
    'protobuf'
    'clang'
    'lld'
    'zstd'
)
options=(
    !debug
)
provides=('eprofiler-tui')
conflicts=('eprofiler-tui-git')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "opentelemetry-ebpf-profiler-${pkgver}.tar.gz::https://github.com/open-telemetry/opentelemetry-ebpf-profiler/archive/${_opentelemetry_ebpf_profiler_ref}.tar.gz"
    "opentelemetry-proto-${pkgver}.tar.gz::https://github.com/open-telemetry/opentelemetry-proto/archive/${_opentelemetry_proto_ref}.tar.gz"
)
sha256sums=(
    'bba7219c30125e4e3d23af1321c1600066382e3744e6bf698fb1e598bf4b9b83'
    '429b1516413bd332542ff18de8260d25793d43bd8e03a2d4b9cab672e300b8a8'
    'dd6dcc642345e092e7c8e90560df4b0ff9f9aa513638c9ca2e4b40559a6ecadc'
)

prepare() {
    cd "$pkgname-$pkgver"
    rm -rf opentelemetry-ebpf-profiler opentelemetry-proto
    ln -sf "../opentelemetry-ebpf-profiler-${_opentelemetry_ebpf_profiler_ref}" 'opentelemetry-ebpf-profiler'
    ln -sf "../opentelemetry-proto-${_opentelemetry_proto_ref}" 'opentelemetry-proto'
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/eprofiler-tui "$pkgdir/usr/bin/eprofiler-tui"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
