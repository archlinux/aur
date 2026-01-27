# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=thorium
pkgver=1.5.0
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
b2sums=('24fb72997adeb6e058ea3750a0c50614c9a269ba500dd40984d54b3261a5a725c6f1d407bf8bfb5b9aceca72bdd4321c0cdffec2625c193b4de5222b72bfdfa6')
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
