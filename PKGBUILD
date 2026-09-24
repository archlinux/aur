# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=thorium
pkgver=1.8.1
pkgrel=1
pkgdesc="A highly scalable, distributed malware analysis and data generation framework"
arch=(x86_64)
url="https://cisagov.github.io/thorium/"
license=(LicenseRef-custom)
depends=(
    gcc-libs
    glibc
    openssl
    xz
    zlib
)
makedepends=(
    cargo-nightly
    git
)
source=($pkgname::git+https://github.com/cisagov/thorium.git#tag=$pkgver)
b2sums=('71842e8efa776304512f4e9fe6cc2264eaff45e9b34c0017022e4f0fab4b7ab284a14589ab046a56595b671dcdd718cd81869e875ae08cbc3541ab21f03f5567')
options=(!lto)

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=nightly
    export OPENSSL_NO_VENDOR=1
    cargo fetch --locked --target host-tuple
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export OPENSSL_NO_VENDOR=1
    export RUSTFLAGS="$RUSTFLAGS -C target-feature=+aes,+sse2"
    cargo build --frozen --release
}

# TODO: run tests when they are fixed
# See: https://github.com/cisagov/thorium/issues/26
# check() {
#    cd $pkgname
#    export RUSTUP_TOOLCHAIN=nightly
#    export OPENSSL_NO_VENDOR=1
#    export RUSTFLAGS="$RUSTFLAGS -C target-feature=+aes,+sse2"
#    cargo test --frozen
# }

package() {
    cd $pkgname/target/release
    install -Dm0755 -t "$pkgdir"/usr/bin/ thoradm
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorctl
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-agent
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-api
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-event-handler
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-operator
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-reactor
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-scaler
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-search-streamer
    install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
