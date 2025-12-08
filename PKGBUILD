# Maintainer: Zero <inarrituzanetti@outlook.com>
pkgname=typetype
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal terminal typing practice for programmers app written in Rust"
# FIX 1: Bash arrays use spaces, NOT commas
arch=('x86_64' 'aarch64')
# FIX 2: Remove .git from the homepage URL for cleaner presentation
url="https://gitlab.com/00sen/typetype"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')

# FIX 3: GitLab source URLs look different than GitHub.
# They usually follow this format: /-/archive/TAG/Project-TAG.tar.gz
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('eda1fab707e036897b218090af93970b22224ccec695a6ab72c89cae2ed95543')

prepare() {
    # FIX 4: GitLab tarballs extract to "Project-Version", not "Project-Version" (sometimes case sensitive)
    # This cd command ensures we go into the right folder.
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-v$pkgver"
    # FIX 5: Ensure your binary in target/release matches the name here.
    # If your Cargo.toml says name="typoo-rust", change this line to install that file!
    install -Dm755 target/release/typetype "$pkgdir/usr/bin/typetype"
}
