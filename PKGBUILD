# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen
pkgver=0.9.0
pkgrel=1
pkgdesc="Asymmetric key generation and inspection tool for moshpit"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=('cargo' 'cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rustyhorde/moshpit/archive/v$pkgver.tar.gz")
sha256sums=('728cf19995ea86f0d824dbff9af1b58f3074f61387a4527a84e5a269f2c2de29')

prepare() {
    cd "moshpit-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "moshpit-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export VERGEN_IDEMPOTENT=1
    cargo build --release --locked --bin mp-keygen
    cargo xtask dist mp-keygen
}

package() {
    cd "moshpit-$pkgver"

    # Binary
    install -Dm755 "target/release/mp-keygen" "$pkgdir/usr/bin/mp-keygen"

    # Man page
    install -Dm644 "dist/mp-keygen/mp-keygen.1" "$pkgdir/usr/share/man/man1/mp-keygen.1"

    # Shell completions
    install -Dm644 "dist/mp-keygen/mp-keygen.bash" \
        "$pkgdir/usr/share/bash-completion/completions/mp-keygen"
    install -Dm644 "dist/mp-keygen/_mp-keygen" \
        "$pkgdir/usr/share/zsh/site-functions/_mp-keygen"
    install -Dm644 "dist/mp-keygen/mp-keygen.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/mp-keygen.fish"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
