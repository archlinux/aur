# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-vet
pkgver=0.5.1
# Repository tag omits trailing .0: for example, the tag for v0.3.0 is 0.3.
_tag=${pkgver%.0}
pkgrel=1
pkgdesc='Supply-chain security for Rust'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/mozilla/cargo-vet'
license=('Apache' 'MIT')
depends=(
    cargo
    gcc-libs
    glibc
    zlib
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_tag.tar.gz")
sha256sums=('b555e72029fe1ac87eaa732c804de8d1eb6a7fcf90ce9bc1ea1e43caa0280e50')

prepare() {
    cd "$pkgname-$_tag"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$_tag"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_tag"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # The tests depend on the value of Git core.abbrev, and assume it's the default: 7. As that's
    # not sufficient in larger projects, and users may have set theirs to some other (larger) value,
    # force core.abbrev=7 when running the tests.
    export GIT_CONFIG_COUNT=1
    export GIT_CONFIG_KEY_0=core.abbrev
    export GIT_CONFIG_VALUE_0=7

    cargo test --frozen
}

package() {
    cd "$pkgname-$_tag"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
