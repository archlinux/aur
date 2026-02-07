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
  export CARGO_TARGET_DIR="$srcdir/target"
  
  # Create target directory structure
  mkdir -p "$srcdir/target"
  
  # Fetch dependencies with target-specific optimization
  cargo fetch --target "$CARCH-unknown-linux-gnu"
  
  # Ensure all features are available
  cargo check --features="all-features" --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  
  # Optimized Rust compilation flags for AUR
  export CARGO_TARGET_DIR="$srcdir/target"
  export CARGO_BUILD_JOBS=$(nproc)
  export RUSTFLAGS="-C target-cpu=native -C opt-level=3 -C embed-bitcode=no -C codegen-units=1 -C lto=fat -C panic=abort"
  export CFLAGS="${CFLAGS} -flto -march=native -mtune=native"
  export CXXFLAGS="${CXXFLAGS} -flto -march=native -mtune=native"
  
  # Build with all features enabled for maximum functionality
  cargo build --release --frozen --features="all-features" --target "$CARCH-unknown-linux-gnu"
  
  # Generate shell completions
  mkdir -p completions
  ./target/$CARCH-unknown-linux-gnu/release/echomind --generate-completion bash > completions/echomind.bash
  ./target/$CARCH-unknown-linux-gnu/release/echomind --generate-completion zsh > completions/_echomind
  ./target/$CARCH-unknown-linux-gnu/release/echomind --generate-completion fish > completions/echomind.fish
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --release --frozen --features="all-features" --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 target/$CARCH-unknown-linux-gnu/release/echomind "$pkgdir/usr/bin/echomind"
  
  # Install documentation (use docs/ directory for actual files)
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  install -Dm644 docs/config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
  install -Dm644 docs/CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 docs/RELEASE_NOTES.md "$pkgdir/usr/share/doc/$pkgname/RELEASE_NOTES.md"
  install -Dm644 instructions.md "$pkgdir/usr/share/doc/$pkgname/instructions.md"
  
  # Install man page
  install -Dm644 echomind.1 "$pkgdir/usr/share/man/man1/echomind.1"
  gzip -n "$pkgdir/usr/share/man/man1/echomind.1"
  
  # Install license
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install shell completions
  install -Dm644 completions/echomind.bash "$pkgdir/usr/share/bash-completion/completions/echomind"
  install -Dm644 completions/_echomind "$pkgdir/usr/share/zsh/site-functions/_echomind"
  install -Dm644 completions/echomind.fish "$pkgdir/usr/share/fish/vendor_completions.d/echomind.fish"
}
