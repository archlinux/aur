# Maintainer: Franco Escobar <francoescobarvrx@gmail.com>
#
# AUR package (git). Users install with:
#   yay -S record-ui-git
#   # or: paru -S record-ui-git
#
# After install: `record-ui` is on PATH and a .desktop entry is registered
# (walker / app menus find "record-ui" with no manual setup).

pkgname=record-ui-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 frontend for wf-recorder on Hyprland: region, one monitor, dual-monitor layout-true stitch"
arch=('x86_64' 'aarch64')
url="https://github.com/FrancoEscob/record-ui"
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
)
provides=('record-ui')
conflicts=('record-ui')
options=(!lto) # quieter first builds with gtk crates; remove if you prefer full LTO
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Prefer tags when they exist; otherwise r<commits>.g<short>
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
  cargo build --frozen --release --bin record-ui
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/record-ui" "$pkgdir/usr/bin/record-ui"
  install -Dm644 "data/record-ui.desktop" \
    "$pkgdir/usr/share/applications/record-ui.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/record-ui/README.md"
}
