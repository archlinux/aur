# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=cargo-vet
pkgver=0.4.0
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_tag.tar.gz"
        "update-lock-and-tests-for-0.4.0.patch::$url/commit/c0dd08419862.patch")
sha256sums=('6558c4010241c146dfac540f5e4a14e8fa1256e7ac11e143fed0eb89e8601eba'
            'd63425206d41e45dd8532ebad6b1b20f4c1a34fd833c04e5624b32fdb175de46')

prepare() {
    cd "$pkgname-$_tag"

    # Cargo.lock and tests not in sync with Cargo.toml in 0.4.0.
    # TODO: remove when no longer necessary.
    patch --forward --strip=1 --input="${srcdir}/update-lock-and-tests-for-0.4.0.patch"

    # The tests depend on the value of Git core.abbrev, and assume it's the default: 7. As that's
    # not sufficient in larger projects, and users may have set theirs to some other (larger) value,
    # force core.abbrev=7 when running the tests.
    export GIT_CONFIG_COUNT=1
    export GIT_CONFIG_KEY_0=core.abbrev
    export GIT_CONFIG_VALUE_0=7

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

    cargo test --frozen
}

package() {
    cd "$pkgname-$_tag"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
