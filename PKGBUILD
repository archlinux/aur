# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=fs_cli-rs
pkgver=1.4.1
pkgrel=1
pkgdesc="Interactive FreeSWITCH ESL CLI client, standalone without the full FreeSWITCH suite"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/fs_cli-rs"
license=('MIT OR Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ticpu/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5fe836f381623afc0e8dab5a7710c5c287f648d236b5329f4009a98331bef02f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/fs_cli" "$pkgdir/usr/bin/fs_cli-rs"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
