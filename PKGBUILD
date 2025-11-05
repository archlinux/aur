# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-git
pkgver=0.4.5.r6.ga1e1982
pkgrel=3
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (git version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
depends=('pacman' 'curl' 'bash' 'sudo')
optdepends=(
    'paru: AUR package installation'
    'yay: alternative AUR helper'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'reflector: update Arch mirrors'
    'pacman-mirrors: Manjaro mirrorlist'
    'alacritty: run external commands in a terminal'
    'kitty: run external commands in a terminal'
    'ghostty: run external commands in a terminal'
    'xterm: run external commands in a terminal'
    'gnome-terminal: run external commands in a terminal'
    'konsole: run external commands in a terminal'
    'xfce4-terminal: run external commands in a terminal'
    'tilix: run external commands in a terminal'
    'mate-terminal: run external commands in a terminal'
    'neovim: external editor'
    'vim: external editor'
    'emacs: external editor'
    'helix: external editor'
    'nano: external editor'
    'klipper: clipboard manager on X11'
    'clamav: malware scanning of files'
    'trivy: vulnerability scanning'
    'semgrep-bin: static analysis checks'
    'shellcheck: lint shell scripts'
    'downgrade: Downgrade of Packages'
)
makedepends=('cargo' 'git')
conflicts=('pacsea' 'pacsea-bin')
provides=('pacsea')
# Empty source array - using custom source() function for sparse checkout
source=()
sha256sums=()

# Custom source function to clone with sparse checkout, excluding Images/ and Documents/
# This significantly reduces download size by not fetching unnecessary documentation and images
source() {
  : "${srcdir:?srcdir is not set}"
  local repo_url="https://github.com/Firstp1ck/Pacsea.git"
  local repo_name="Pacsea"
  local repo_path="$srcdir/$repo_name"
  
  # Ensure srcdir exists
  mkdir -p "$srcdir"
  
  # Change to srcdir to avoid being in the directory we're about to remove
  cd "$srcdir" || exit 1
  
  # Always remove existing directory/repository to ensure clean state
  # This handles cases where previous clones failed or were interrupted
  if [ -e "$repo_path" ]; then
    msg "Clearing existing repository directory..."
    rm -rf "$repo_path"
  fi
  
  # Ensure the directory is completely removed before cloning
  # Wait a moment if needed for filesystem to sync
  if [ -e "$repo_path" ]; then
    error "Failed to remove existing directory: $repo_path"
    exit 1
  fi
  
  # Clone with sparse checkout enabled, using partial clone to reduce download size
  # Note: Using --filter=blob:none reduces download size by not fetching file contents until needed
  if ! git clone --filter=blob:none --sparse "$repo_url" "$repo_path"; then
    error "Failed to clone repository"
    exit 1
  fi
  
  cd "$repo_path" || exit 1
  
  # Configure sparse checkout to exclude Images/ and Documents/ directories
  git sparse-checkout init --no-cone
  git sparse-checkout set '/*' '!/Images' '!/Documents'
  
  # git sparse-checkout set automatically checks out files in newer Git versions
  # For older versions or to ensure files are checked out, run checkout
  git checkout 2>/dev/null || true
}

pkgver() {
  : "${srcdir:?srcdir is not set}"
  # Always ensure we have a fresh clone for version detection
  # If source directory doesn't exist or is invalid, call source() to download it
  if [ ! -d "$srcdir/Pacsea/.git" ]; then
    msg "Source directory not found or invalid, downloading sources..."
    source
  fi
  cd "$srcdir/Pacsea" || exit 1
  git describe --tags --long --always \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  : "${srcdir:?srcdir is not set}"
  # If source directory doesn't exist or is invalid, call source() to download it
  if [ ! -d "$srcdir/Pacsea/.git" ]; then
    msg "Source directory not found or invalid, downloading sources..."
    source
  fi
  cd "$srcdir/Pacsea" || exit 1
  
  # Fetch dependencies according to Cargo.lock to ensure reproducible builds
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  : "${srcdir:?srcdir is not set}"
  if [ ! -d "$srcdir/Pacsea" ]; then
    error "Source directory $srcdir/Pacsea does not exist. Run makepkg to download sources first."
    exit 1
  fi
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  : "${srcdir:?srcdir is not set}"
  if [ ! -d "$srcdir/Pacsea" ]; then
    error "Source directory $srcdir/Pacsea does not exist. Run makepkg to download sources first."
    exit 1
  fi
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features -- --test-threads=1
}

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"
  if [ ! -d "$srcdir/Pacsea" ]; then
    error "Source directory $srcdir/Pacsea does not exist. Run makepkg to download sources first."
    exit 1
  fi
  cd "$srcdir/Pacsea" || exit 1
  # The crate builds a binary named 'pacsea'; install it as 'pacsea'
  install -Dm755 "target/release/pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
