# Maintainer: Nick Nizovtsev <nizovtsevnv@gmail.com>

pkgname=termide
pkgver=0.50.0
pkgrel=1
pkgdesc="All-in-one terminal workspace: editor, file manager, terminal, git and coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/termide/termide"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/termide/termide/archive/$pkgver.tar.gz")
sha256sums=('42e4236a2cd552106d8df815dd282ecae9c02f828eae1e0056f2e6287ef9ebd5')
# makepkg's LTO turns the grammars' C objects into GCC bytecode that rustc's
# link cannot resolve (undefined tree_sitter_* symbols).
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    # makepkg's CFLAGS replace the repository's (.cargo/config.toml): keep the
    # grammars' C code off strict aliasing, which the Haskell scanner breaks.
    export CFLAGS="$CFLAGS -fno-strict-aliasing"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    # makepkg's CFLAGS replace the repository's (.cargo/config.toml): keep the
    # grammars' C code off strict aliasing, which the Haskell scanner breaks.
    export CFLAGS="$CFLAGS -fno-strict-aliasing"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell completions
    install -Dm644 completions/termide.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/_termide "$pkgdir/usr/share/zsh/site-functions/_termide"
    install -Dm644 completions/termide.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
