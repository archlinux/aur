# Maintainer: Thorben Günther <admin@xenrox.net>

pkgname=forgejo-cli
pkgver=0.4.1
pkgrel=1
pkgdesc='CLI application for interacting with Forgejo'
url='https://codeberg.org/forgejo-contrib/forgejo-cli'
license=('Apache-2.0 OR MIT')
makedepends=('cargo')
depends=('openssl' 'libssh2')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/forgejo-contrib/forgejo-cli/archive/v$pkgver.tar.gz")
sha256sums=('8f6a93c5f97e45308aead0154d4ec53e672ca90ab0809db543cde6be8078729e')
options=(!lto)

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo build --frozen --release --all-features

    target/release/fj completion bash > fj.bash
    target/release/fj completion zsh > fj.zsh
    target/release/fj completion fish > fj.fish
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/fj"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/forgejo-cli/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/forgejo-cli/LICENSE-MIT"
    install -Dm644 fj.bash "$pkgdir/usr/share/bash-completion/completions/fj"
    install -Dm644 fj.zsh "$pkgdir/usr/share/zsh/site-functions/_fj"
    install -Dm644 fj.fish "$pkgdir/usr/share/fish/vendor_completions.d/fj.fish"
}
