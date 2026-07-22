# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-usagebar
pkgver=0.15.0
pkgrel=1
pkgdesc="Waybar widget + TUI for AI plan usage across Anthropic, OpenAI, Z.AI, OpenRouter, DeepSeek, and Kimi"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/ai-usagebar"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'nasm')
optdepends=(
    'waybar: status bar that hosts the widget'
    'libnotify: desktop notifications on hard auth failures'
)
# LTO is disabled because ring's C/asm objects (used by reqwest's rustls
# backend) don't ship LTO bitcode and Arch's default `-flto=auto` in CFLAGS
# triggers undefined-symbol link errors on x86_64.
# !debug because Cargo.toml's release profile already strips symbols, so
# the auto-generated -debug split would be empty AND would collide with
# `ai-usagebar-bin-debug` if both variants were ever installed.
options=('!lto' '!debug')
# Pacman should auto-remove the binary variant when switching to source.
conflicts=('ai-usagebar-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e3742eac73fe6f22584cb42fe25e798601d8fc29f35c698bd7104c1de9ffce8')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    # `--test live` is skipped automatically because every test in it is
    # marked `#[ignore]` (live tests need real API credentials).
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/"                       "target/release/ai-usagebar"
    install -Dm0755 -t "$pkgdir/usr/bin/"                       "target/release/ai-usagebar-tui"
    install -Dm0644 -t "$pkgdir/usr/share/$pkgname/"            "config.example.toml"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/"        "README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
