# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-git
pkgver=0.6.2.r0.g223a9c7
pkgrel=1
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (git version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
depends=('pacman' 'curl' 'bash' 'sudo' 'coreutils' 'grep' 'xdg-utils')
optdepends=(
    'paru: AUR package installation'
    'yay: alternative AUR helper'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'reflector: update Arch mirrors'
    'pacman-mirrors: Manjaro mirrorlist'
    'rate-mirrors: Artix mirror rating'
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
source() {
  cd "$srcdir" || exit 1
  if [ ! -d Pacsea ]; then
    git clone --filter=blob:none --sparse https://github.com/Firstp1ck/Pacsea.git Pacsea
  fi
  cd Pacsea || exit 1
  git sparse-checkout init --no-cone
  git sparse-checkout set '/*' '!/Images' '!/Documents'
  git checkout 2>/dev/null || true
}

pkgver() {
  if [ ! -d "$srcdir/Pacsea" ]; then
    source >/dev/null 2>&1
  fi
  cd "$srcdir/Pacsea" || exit 1
  git describe --tags --long --always \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [ ! -d "$srcdir/Pacsea" ]; then
    source
  fi
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features -- --test-threads=1
}

package() {
  cd "$srcdir/Pacsea" || exit 1
  install -Dm755 "target/release/pacsea" "$pkgdir/usr/bin/pacsea"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install i18n configuration
  install -Dm644 "config/i18n.yml" "$pkgdir/usr/share/pacsea/config/i18n.yml"
  
  # Install locale files
  install -d "$pkgdir/usr/share/pacsea/locales"
  install -m644 config/locales/*.yml "$pkgdir/usr/share/pacsea/locales/"
}
