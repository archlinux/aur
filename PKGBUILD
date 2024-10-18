# Submitter: Jonas Malaco <jonas@protocubo.io>
# Maintainer: Chris Morgan <aur@chrismorgan.info>
pkgname=cargo-vet
pkgver=0.10.0
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
options=(!lto) # see: briansmith/ring#1444 (and #893)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/cargo-vet/releases/download/v$pkgver/source.tar.gz")
sha256sums=('6ea308eb97df6356d76335fadf9cd0ab47c49208351ee7c500fc6c47ce204507')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"

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
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
