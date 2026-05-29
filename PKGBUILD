# Maintainer: Henrik Bernhardt <57109108+Henriklmao@users.noreply.github.com>
pkgname=display-tui-git
pkgver=0.9.3.r44
pkgrel=1
pkgdesc="Minimalistic hyprland monitor configuration TUI."
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0')
depends=('hyprland' 'xdg-terminal-exec')
makedepends=('cargo' 'rust' 'git')
install=display-tui.install
source=('display-tui::git+https://github.com/Henriklmao/display-tui.git'
  'display-tui.desktop')
sha256sums=('SKIP'
  'SKIP')

pkgver() {
  cd "$srcdir/display-tui"
  local release=$(grep '^version' Cargo.toml | head -1 | cut -d'"' -f2)
  local revision=$(git rev-list --count HEAD)
  printf "%s.r%s" "$release" "$revision"
}

build() {
  cd "$srcdir/display-tui"
  cargo build --release
}

package() {
  cd "$srcdir/display-tui"

  # Install binary
  install -Dm 755 "target/release/display-tui" "$pkgdir/usr/bin/display-tui"

  # Install desktop icon (globally)
  install -Dm 644 "assets/desktop-icon.png" "$pkgdir/usr/share/pixmaps/display-tui.png"

  # Install desktop entry (globally)
  cd "$srcdir"
  install -Dm 644 "display-tui.desktop" "$pkgdir/usr/share/applications/display-tui.desktop"
}
