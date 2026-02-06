# Maintainer: Pinak Dhabu <thepinak503@duck.com>
pkgname=echomind
pkgver=0.3.2
pkgrel=4
pkgdesc="AI-powered CLI tool with multiple provider support, streaming, and interactive mode"
arch=('x86_64' 'aarch64')
url="https://github.com/thepinak503/echomind"
license=('MIT')
depends=('openssl' 'gcc-libs' 'glibc')
makedepends=('rust' 'cargo' 'clang')
optdepends=(
  'jq: for JSON output formatting'
  'xclip: clipboard support (X11)'
  'xsel: clipboard support alternative (X11)'
  'wl-clipboard: clipboard support (Wayland)'
  'sox: voice input support (macOS)'
  'arecord: voice input support (Linux)'
  'espeak: text-to-speech support (Linux)'
)
provides=('echomind')
conflicts=('echomind-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thepinak503/echomind/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS="${CFLAGS} -flto"
  export CXXFLAGS="${CXXFLAGS} -flto"
  
  # Use all available cores for faster builds
  export CARGO_BUILD_JOBS=$(nproc)
  
  cargo build --release --frozen --features voice,images
  
  # Generate shell completions
  mkdir -p completions
  ./target/release/echomind --generate-completion bash > completions/echomind.bash
  ./target/release/echomind --generate-completion zsh > completions/_echomind
  ./target/release/echomind --generate-completion fish > completions/echomind.fish
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 target/release/echomind "$pkgdir/usr/bin/echomind"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 ENHANCED_FEATURES.md "$pkgdir/usr/share/doc/$pkgname/ENHANCED_FEATURES.md"
  install -Dm644 INSTALL.md "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"
  
  # Install man page
  install -Dm644 echomind.1 "$pkgdir/usr/share/man/man1/echomind.1"
  gzip -n "$pkgdir/usr/share/man/man1/echomind.1"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install shell completions
  install -Dm644 completions/echomind.bash "$pkgdir/usr/share/bash-completion/completions/echomind"
  install -Dm644 completions/_echomind "$pkgdir/usr/share/zsh/site-functions/_echomind"
  install -Dm644 completions/echomind.fish "$pkgdir/usr/share/fish/vendor_completions.d/echomind.fish"
}
