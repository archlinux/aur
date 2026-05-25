# Maintainer: Jay Thomas <jay@gfax.ch>
pkgname=clutch
pkgver=0.1.0
pkgrel=1
pkgdesc="A highly customizable TUI RPC client for Transmission BitTorrent"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/jay-thomas/clutch"
license=('GPL-3.0-only')
depends=()
makedepends=('gcc-libs' 'git' 'rustup')
optdepends=('bash-completion: tab completion for bash'
            'fish: tab completion for fish'
            'zsh: tab completion for zsh (requires compinit in ~/.zshrc)')
options=('!debug')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export TARGET=$(rustc -vV | sed -n 's/host: //p')
    cargo fetch --locked --target $TARGET
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export TARGET=$(rustc -vV | sed -n 's/host: //p')
    # ring's C sources are compiled by GCC via the cc crate, which inherits
    # CFLAGS. Arch Linux's default -flto=auto produces GCC GIMPLE LTO bitcode
    # that rust-lld (LLVM) cannot read, causing undefined symbol errors.
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CFLAGS="${CFLAGS/-ffat-lto-objects/}"
    export LDFLAGS="${LDFLAGS/,-flto=auto/}"
    rustup show
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "completions/$pkgname.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "completions/$pkgname.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "completions/_$pkgname" \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
