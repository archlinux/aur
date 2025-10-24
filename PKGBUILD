# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-git
pkgver=0.4.2.r3.g663d3444
pkgrel=1
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
  'xdg-utils: open URLs (xdg-open)'
  'reflector: update Arch mirrors'
  'alacritty: run external commands in a terminal'
  'neovim: external editor'
  'downgrade: Downgrade of Packages'
)
makedepends=('cargo' 'git')
conflicts=('pacsea' 'pacsea-bin')
provides=('pacsea')
source=("git+https://github.com/Firstp1ck/Pacsea.git")
sha256sums=('SKIP')

pkgver() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  git describe --tags --long --always \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  # Fetch dependencies according to Cargo.lock to ensure reproducible builds
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features -- --test-threads=1
}

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"
  cd "$srcdir/Pacsea" || exit 1
  # The crate builds a binary named 'pacsea'; install it as 'pacsea'
  install -Dm755 "target/release/pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
