# Maintainer: Sandra Keßler <mail@sandra-kessler.net>
pkgname=zerodds
pkgver=1.0.0_rc1
pkgrel=1
pkgdesc="Pure-Rust OMG Data Distribution Service implementation (built from source)"
arch=('x86_64' 'aarch64')
url="https://zerodds.org"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust>=1.88' 'cargo' 'git' 'pkg-config' 'openssl')
optdepends=('clang: required for some bridge integration tests')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zero-objects/zero-dds/archive/refs/tags/v${pkgver//_/-.}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "zero-dds-${pkgver//_/-.}"
    cargo fetch --locked
}

build() {
    cd "zero-dds-${pkgver//_/-.}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

package() {
    cd "zero-dds-${pkgver//_/-.}"

    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" "${pkgdir}/usr/include"

    local bin
    for bin in zerodds-{ws,mqtt,coap,amqp,grpc,corba}-bridged \
               zerodds-{admin,idlc,xmlc,record,replay,bench,monitor,mq,pcap,perf} \
               zerodds-ros2-shim; do
        if [[ -f "target/release/${bin}" ]]; then
            install -m755 "target/release/${bin}" "${pkgdir}/usr/bin/${bin}"
        fi
    done

    if [[ -f "target/release/libzerodds.so" ]]; then
        install -m755 "target/release/libzerodds.so" "${pkgdir}/usr/lib/libzerodds.so"
    fi
    if [[ -f "crates/zerodds-c-api/include/zerodds.h" ]]; then
        install -m644 "crates/zerodds-c-api/include/zerodds.h" "${pkgdir}/usr/include/zerodds.h"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
