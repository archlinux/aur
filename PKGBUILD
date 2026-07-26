# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait-git
_pkgname=cfait
pkgver=1727.7164b8cb.rolling
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local, git version)"
arch=('x86_64')
url="https://git.disroot.org/trougnouf/cfait"
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'fontconfig'        # Required by the GUI for system font discovery
    'libxkbcommon'      # Required by the GUI for keyboard handling (especially on Wayland)
    'vulkan-icd-loader' # Required by the GUI to load Vulkan drivers for rendering
    'org.freedesktop.secrets'  # Required to store the CalDAV password
)
makedepends=('cargo' 'pkgconf' 'git')  # git is needed as long as libdav > 0.10.3 is not released
# Optional dependencies for the GUI and specific features
optdepends=(
    'vulkan-driver: Required by the GUI for hardware-accelerated rendering'
    'wayland: Required by the GUI for Wayland session support'
    'libx11: Required by the GUI for X11 session support'
    'libxcursor: Required by the GUI for X11 cursor support'
    'libxi: Required by the GUI for X11 input devices'
    'libxrandr: Required by the GUI for X11 monitor layout support'
    'xdg-desktop-portal: Required by the GUI for the file picker (export/import)'
)
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
  # Skip compiling the problematic fallback RNG.
  # Linux's native getrandom() is used instead.
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  cargo build --release --features gui
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "target/release/cfait-gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
  install -Dm644 "assets/cfait.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cfait.svg"
}
