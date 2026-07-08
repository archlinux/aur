# Maintainer: Sandra Keßler <mail@sandra-kessler.net>
pkgname=zerodds
pkgver=1.0.0_rc.5
pkgrel=1
pkgdesc="Pure-Rust OMG Data Distribution Service implementation (built from source)"
arch=('x86_64' 'aarch64')
url="https://zerodds.org"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('rust>=1.88' 'cargo' 'git' 'pkg-config' 'openssl')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zero-objects/zero-dds/archive/refs/tags/v1.0.0-rc.5.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "zero-dds-1.0.0-rc.5"
    cargo fetch --locked
}

build() {
    cd "zero-dds-1.0.0-rc.5"
    cargo build --frozen --release --workspace --exclude zerodds-durability-store-lakehouse --exclude zerodds-durability-service-bin
}

package() {
    cd "zero-dds-1.0.0-rc.5"
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
}
