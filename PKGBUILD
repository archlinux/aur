# Maintainer: Justice-Reaper <justice.reaper.io@gmail.com>

pkgname=hyprland-minimizer-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimize Hyprland windows to the system tray, with real icon resolution and rofi tray helpers"
arch=('x86_64' 'aarch64')
url="https://github.com/Justice-Reaper/hyprland-minimizer"
license=('custom')
depends=('hyprland' 'gcc-libs')
makedepends=('git' 'cargo')
optdepends=('waybar: StatusNotifier tray host for the icons')
provides=('hyprland-minimizer')
conflicts=('hyprland-minimizer')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver
  ver=$(awk -F'"' '/^version/{print $2; exit}' Cargo.toml)
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/hyprland-minimizer" "$pkgdir/usr/bin/hyprland-minimizer"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
