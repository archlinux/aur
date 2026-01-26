# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=thorium
pkgver=1.4.0
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
b2sums=('2a747c67dfe1b1c95771694ad3b622e69a74923649c4b69fd8cf74696ec705c33feeb15b0906bd5769add8362b25ca20bcb5c4a2b8413e7114bcdfc60d3e7890')
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
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-agent
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-api
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-event-handler
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-operator
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-reactor
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-scaler
    install -Dm0755 -t "$pkgdir"/usr/bin/ thorium-search-streamer
    install -Dm644 "$srcdir"/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
