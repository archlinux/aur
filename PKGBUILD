# Maintainer: Jan Muixi <jan.muixi@flanks.io>
pkgname=hyprmonitor-git
pkgver=r53.f40bb77
pkgrel=1
pkgdesc="Auto-configures Hyprland monitors with an optional drag-and-drop GUI"
arch=('x86_64')
url="https://github.com/Janmuixi/hyprmonitors"
license=('MIT')  # add a LICENSE file to the repo first if not present
depends=('hyprland' 'libnotify' 'wayland' 'libxkbcommon' 'fontconfig')
makedepends=('git' 'rust' 'cargo')
provides=('hyprmonitor' 'hyprmonitor-gui')
conflicts=('hyprmonitor' 'hyprmonitor-gui')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --workspace --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/hyprmonitor "$pkgdir/usr/bin/hyprmonitor"
  install -Dm755 target/release/hyprmonitor-gui "$pkgdir/usr/bin/hyprmonitor-gui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

