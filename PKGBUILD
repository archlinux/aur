# Maintainer: Pinak Dhabu <thepinak503@duck.com>
pkgname=echomind
pkgver=0.3.5
pkgrel=3
pkgdesc="AI-powered CLI tool with multiple provider support, streaming, and interactive mode"
arch=('x86_64' 'aarch64')
url="https://github.com/thepinak503/echomind"
license=('MIT')
depends=('openssl' 'gcc-libs' 'glibc' 'alsa-lib')
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
  
  # Determine target triple
  if [ "$CARCH" = "x86_64" ]; then
    _target="x86_64-unknown-linux-gnu"
  elif [ "$CARCH" = "aarch64" ]; then
    _target="aarch64-unknown-linux-gnu"
  else
    _target="$CARCH-unknown-linux-gnu"
  fi
  
  # Create target directory structure
  mkdir -p "$srcdir/target"
  
  # Update Cargo.lock if needed and fetch dependencies
  cargo fetch --target "$_target"
}


build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  
  # Determine target triple
  if [ "$CARCH" = "x86_64" ]; then
    _target="x86_64-unknown-linux-gnu"
  elif [ "$CARCH" = "aarch64" ]; then
    _target="aarch64-unknown-linux-gnu"
  else
    _target="$CARCH-unknown-linux-gnu"
  fi
  
  # Optimized Rust compilation flags for AUR
  export CARGO_TARGET_DIR="$srcdir/target"
  export CARGO_BUILD_JOBS=$(nproc)
  export RUSTFLAGS="-C target-cpu=native -C opt-level=3 -C codegen-units=1"
  export CFLAGS="${CFLAGS} -flto -march=native -mtune=native"
  export CXXFLAGS="${CXXFLAGS} -flto -march=native -mtune=native"
  
  # Build with all features enabled
  cargo build --release --all-features --target "$_target"
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  
  # Determine target triple
  if [ "$CARCH" = "x86_64" ]; then
    _target="x86_64-unknown-linux-gnu"
  elif [ "$CARCH" = "aarch64" ]; then
    _target="aarch64-unknown-linux-gnu"
  else
    _target="$CARCH-unknown-linux-gnu"
  fi
  
  cargo test --release --all-features --target "$_target"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export CARGO_TARGET_DIR="$srcdir/target"
  
  # Determine target triple
  if [ "$CARCH" = "x86_64" ]; then
    _target="x86_64-unknown-linux-gnu"
  elif [ "$CARCH" = "aarch64" ]; then
    _target="aarch64-unknown-linux-gnu"
  else
    _target="$CARCH-unknown-linux-gnu"
  fi
  
  # Install binary
  install -Dm755 "$CARGO_TARGET_DIR/$_target/release/echomind" "$pkgdir/usr/bin/echomind"
  
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
}
