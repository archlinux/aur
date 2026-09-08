# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
pkgname=fs_cli-rs
pkgver=1.6.0
pkgrel=1
pkgdesc="Interactive FreeSWITCH ESL CLI client (fs-cli), standalone without the full FreeSWITCH suite"
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/fs_cli-rs"
license=('MIT OR Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ticpu/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('807366963dd96651b9b34ed52652349b68af3f350f4a947089a77d6a156355a9')

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
