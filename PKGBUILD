# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-git
pkgver=0.8.2.r47.g32c9bbe7
pkgrel=1
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
depends=('pacman' 'curl' 'bash' 'sudo' 'coreutils' 'grep' 'xdg-utils' 'hicolor-icon-theme')
optdepends=(
    'paru: AUR package installation'
    'yay: alternative AUR helper'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'reflector: update Arch mirrors'
    'pacman-mirrors: Manjaro mirrorlist'
    'rate-mirrors: Artix mirror rating'
    'klipper: clipboard manager on X11'
    'clamav: malware scanning of files'
    'trivy: vulnerability scanning'
    'semgrep-bin: static analysis checks'
    'shellcheck: lint shell scripts'
    'downgrade: Downgrade of Packages'
    'pacman-contrib: Used as a fallback for update checking'
)

makedepends=('cargo' 'git')
conflicts=('pacsea' 'pacsea-bin')
provides=('pacsea')
# Track the latest upstream main branch through makepkg's native VCS source handling.
source=('Pacsea::git+https://github.com/Firstp1ck/Pacsea.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Pacsea" || exit 1
  git describe --tags --long --abbrev=8 --always \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/Pacsea" || exit 1
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/Pacsea" || exit 1

  # Strip makepkg's cross-compiler wrappers so aws-lc-sys cmake build
  # uses plain system tools and not x86_64-pc-linux-gnu-* wrappers.
  unset CC CXX AR LD CFLAGS CXXFLAGS LDFLAGS CHOST

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/Pacsea" || exit 1
  unset CC CXX AR LD CFLAGS CXXFLAGS LDFLAGS CHOST
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

  install -Dm644 data/pacsea.desktop "$pkgdir/usr/share/applications/pacsea.desktop"
  install -Dm644 data/assets/pacsea.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pacsea.svg"
}
