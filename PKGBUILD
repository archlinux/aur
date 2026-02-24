# Maintainer: Zeus <zeus@example.com>
pkgname=diskord
pkgver=1.0.2
pkgrel=1
pkgdesc="A fast, intuitive, and universal TUI storage manager for Omarchy (Arch Linux + Hyprland)"
arch=('x86_64')
url="https://github.com/Zeus-Deus/diskord"
license=('GPL')
depends=('hyprland' 'xdg-terminal-exec' 'polkit')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bb654aa5ad1da6bb988e47b2041f97294fdbbe450f58ba579cabe3fb5d897dbb')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install the binary
  install -Dm755 "target/release/diskord" "$pkgdir/usr/bin/diskord"
  
  # Install the desktop file
  # Note: The original exec path in the desktop file points to ~/.local/bin/diskord
  # We need to change this to /usr/bin/diskord for system-wide installation
  install -Dm644 "diskord.desktop" "$pkgdir/usr/share/applications/diskord.desktop"
  sed -i 's|Exec=xdg-terminal-exec --app-id=org.omarchy.Diskord -e /home/zeus/.local/bin/diskord|Exec=xdg-terminal-exec --app-id=org.omarchy.Diskord -e /usr/bin/diskord|g' "$pkgdir/usr/share/applications/diskord.desktop"
  sed -i 's|Exec=xdg-terminal-exec --app-id=org.omarchy.Diskord -e $HOME/.local/bin/diskord|Exec=xdg-terminal-exec --app-id=org.omarchy.Diskord -e /usr/bin/diskord|g' "$pkgdir/usr/share/applications/diskord.desktop"

  
  # Install the icon
  install -Dm644 "assets/diskord.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/diskord.svg"
  
  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
