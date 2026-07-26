# Maintainer: Franco Escobar <francoescobarvrx@gmail.com>
#
# AUR package: record-ui-git  →  /usr/bin/hyprcap  (brand: Hyprcap)
# Do NOT use AUR hyprcap / hyprcap-git — those are a different project.
# Install: yay -S record-ui-git

pkgname=record-ui-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Hyprcap — Rust/GTK4 screen recorder for Hyprland (wf-recorder UI; binary: hyprcap)"
arch=('x86_64' 'aarch64')
url="https://github.com/FrancoEscob/hyprcap"
license=('MIT')
depends=(
  'gtk4'
  'libadwaita'
  'wf-recorder'
  'slurp'
  'ffmpeg'
  'glibc'
  'gcc-libs'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
)
optdepends=(
  'hyprland: multi-monitor inventory + layout-true dual capture (hyprctl)'
  'libnotify: desktop notifications (notify-send)'
  'wl-clipboard: copy absolute path on success (wl-copy)'
  'xdg-utils: open last file/folder from the GUI'
  'pipewire-pulse: system/app/mic audio matrix (pactl; recommended)'
)
provides=('hyprcap' 'record-ui')
conflicts=('hyprcap' 'record-ui' 'hyprcap-git')
options=(!lto)
source=("$pkgname::git+https://github.com/FrancoEscob/hyprcap.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local d
  d=$(git describe --long --tags --abbrev=7 2>/dev/null) && {
    echo "$d" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    return
  }
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin hyprcap
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/hyprcap" "$pkgdir/usr/bin/hyprcap"
  # Transitional alias for the old binary name
  ln -s hyprcap "$pkgdir/usr/bin/record-ui"
  install -Dm644 "data/hyprcap.desktop" \
    "$pkgdir/usr/share/applications/hyprcap.desktop"
  install -Dm644 "data/icons/hicolor/scalable/apps/hyprcap.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprcap.svg"
  install -Dm644 "data/icons/hicolor/256x256/apps/hyprcap.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/hyprcap.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/hyprcap/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/hyprcap/CHANGELOG.md"
}
