# Maintainer: AbsolKing <alexiulian.tanase@gmail.com>

pkgname=heroic-absolking-git
_pkgname=heroic
pkgver=r2869.7ea6a6ed
pkgrel=1
pkgdesc="A personal fork of Heroic Games Launcher with a cleaned-up sidebar, Amazon UI removed, and an Adwaita theme"
arch=('x86_64')
url="https://github.com/AbsolKing/HeroicGamesLauncher"
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'nss'
  'libxss'
  'libnotify'
  'gnome-keyring'
)
makedepends=(
  'git'
  'nodejs>=22'
  'pnpm'
  'python'
)
optdepends=(
  'gamemode: Optimized gaming performance'
  'gamescope: Micro-compositor for gaming'
  'mangohud: Performance overlay'
  'vkd3d: DirectX 12 to Vulkan translation'
  'lib32-vkd3d: DirectX 12 to Vulkan translation (32-bit)'
)
conflicts=('heroic-games-launcher' 'heroic-games-launcher-bin' 'heroic-games-launcher-git')
provides=('heroic-games-launcher')
options=('!strip')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  # Ensure pnpm uses an isolated store inside srcdir
  export npm_config_cache="$srcdir/.npm-cache"
}

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/.npm-cache"
  pnpm install --frozen-lockfile
  pnpm download-helper-binaries
  pnpm dist:linux pacman
}

package() {
  cd "$pkgname"
  # electron-builder produces a .pacman archive in dist/
  local pacfile
  pacfile=$(ls dist/*.pacman 2>/dev/null | head -n1)
  if [[ -z "$pacfile" ]]; then
    echo "ERROR: No .pacman file produced in dist/" >&2
    return 1
  fi
  bsdtar -xf "$pacfile" -C "$pkgdir"
  # Strip pacman metadata so makepkg can produce its own
  rm -f "$pkgdir"/.MTREE "$pkgdir"/.PKGINFO "$pkgdir"/.BUILDINFO
  rm -f "$pkgdir"/.INSTALL 2>/dev/null || true
}
