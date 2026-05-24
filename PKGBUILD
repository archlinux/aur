# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=ai-usagebar
pkgver=0.2.0
pkgrel=1
pkgdesc="Waybar widget + TUI for AI plan usage across Anthropic, OpenAI, Z.AI, and OpenRouter"
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
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3dd6638f667e8a0fb076e1261042a4f6e41e6a649b44a5b6c67a5b36798b3f3b')

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
