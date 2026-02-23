# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait-git
_pkgname=cfait
pkgver=612.b286040.rolling
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local, git version)"
arch=('x86_64')
url="https://codeberg.org/trougnouf/cfait"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo' 'git')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
replaces=('rustycal' 'rustache' 'fairouille')
options=('!lto' '!strip' '!debug')
provides=('cfait-tui' 'cfait-gui' "$_pkgname")

pkgver() {
  cd "$_pkgname"
  # Get the commit hash and count
  local commit_hash=$(git rev-parse --short HEAD)
  local commit_count=$(git rev-list --count HEAD)
  # Get the latest tag (if any)
  local latest_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "rolling")

  # Format: <commit_count>.<commit_hash>.<tag>
  # If no tag, use "rolling" as the tag
  echo "$commit_count.$commit_hash.${latest_tag#v}"
}

build() {
  cd "$_pkgname"
  cargo build --release --features gui
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "target/release/gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
  install -Dm644 "assets/cfait.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cfait.svg"
}
