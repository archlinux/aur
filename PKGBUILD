# Submitter: Jonas Malaco <jonas@protocubo.io>
# Maintainer: Chris Morgan <aur@chrismorgan.info>
pkgname=cargo-vet
pkgver=0.10.1
pkgrel=1
pkgdesc='Supply-chain security for Rust'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/mozilla/cargo-vet'
license=('Apache-2.0' 'MIT')
depends=(
    cargo
    gcc-libs
    glibc
    zlib
)
options=(!lto) # see: briansmith/ring#1444 (and #893)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/cargo-vet/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e997815c03550016426b48170236bcfbac1b5ef45e0ac7297ecfc9df37982253')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"

    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"

    export CARGO_TARGET_DIR=target

    # The tests are fragile, assuming no Git config.
    # See https://github.com/mozilla/cargo-vet/issues/638.
    GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
