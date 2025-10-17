# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=thorium
pkgver=1.3.0
pkgrel=1
_rustupver=nightly-2025-08-01
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
b2sums=('1daa732b255640839d733ed2de410d0e0422371a71734cc51baea6cae7822dec3d7fe57c8e268596bde88b8ab19c88ebac33e30af28d04a0ffa374c6c18e3399')
options=(!lto)

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=$_rustupver
    export OPENSSL_NO_VENDOR=1
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=$_rustupver
    export CARGO_TARGET_DIR=target
    export OPENSSL_NO_VENDOR=1
    export RUSTFLAGS="$RUSTFLAGS -C target-feature=+aes,+sse2"
    cargo build --frozen --release
}

# TODO: run tests when they are fixed
# See: https://github.com/cisagov/thorium/issues/26

# check() {
#    cd $pkgname
#    export RUSTUP_TOOLCHAIN=$_rustupver
#    export OPENSSL_NO_VENDOR=1
#    export RUSTFLAGS="$RUSTFLAGS -C target-feature=+aes,+sse2"
#    cargo test --frozen
# }

package() {
    cd $pkgname/target/release
    install -Dm0755 -t "$pkgdir"/usr/bin/ thoradm
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorctl
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-agent
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-event-handler
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-operator
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-reactor
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-scaler
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-search-streamer
    install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
