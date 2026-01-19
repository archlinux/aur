# Maintainer: Mjoyufull
pkgname=kaleidux-git
pkgver=0.0.1.kneecap.r23.2c9ff2e
pkgrel=1
pkgdesc="High-performance, hardware-accelerated wallpaper daemon for Linux with 50+ smooth GLSL transitions"
arch=('x86_64')
url="https://github.com/Mjoyufull/Kaleidux"
license=('AGPL-3.0-or-later')
depends=(
  'glib2'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'wayland'
  'libxkbcommon'
  'libxcb'
  'vulkan-icd-loader'
  'gcc-libs'
  'libglvnd' 
)
makedepends=(
  'git'
  'rust'
  'cargo'
  'pkgconf'
  'cmake'
  'clang'
  'gcc'
  'python'
  'wayland-protocols'
)
provides=('kaleidux')
conflicts=('kaleidux')
source=('git+https://github.com/Mjoyufull/Kaleidux.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Kaleidux"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    # Fallback: version from Cargo.toml + commit count + short hash
    _version=$(grep -m1 '^version = ' Cargo.toml | sed 's/.*"\(.*\)".*/\1/' | tr '-' '.')
    _commits=$(git rev-list --count HEAD)
    _hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.%s" "$_version" "$_commits" "$_hash"
  fi
}

prepare() {
  cd "$srcdir/Kaleidux"
  cargo fetch --locked
}

build() {
  cd "$srcdir/Kaleidux"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  
  # Remap source paths to prevent $srcdir references in binary
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  
  cargo build --locked --release --all-features
}

check() {
  cd "$srcdir/Kaleidux"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features || true
}

package() {
  cd "$srcdir/Kaleidux"
  
  # Install binaries
  install -Dm755 target/release/kaleidux-daemon "$pkgdir/usr/bin/kaleidux-daemon"
  install -Dm755 target/release/kldctl "$pkgdir/usr/bin/kldctl"
  
  # Install man pages
  install -Dm644 man/kaleidux-daemon.1 "$pkgdir/usr/share/man/man1/kaleidux-daemon.1"
  install -Dm644 man/kldctl.1 "$pkgdir/usr/share/man/man1/kldctl.1"
  
  # Install example config
  install -Dm644 config.example.toml "$pkgdir/usr/share/kaleidux/config.example.toml"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
