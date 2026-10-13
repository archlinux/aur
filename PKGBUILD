# Maintainer: AymanLyesri <https://github.com/AymanLyesri>
pkgname=walleclipse-git
pkgver=0.1.0.r29.g44bf280
pkgrel=1
pkgdesc="Preloaded layer-shell wallpaper daemon for Hyprland (hyprpaper replacement)"
arch=('x86_64')
url="https://github.com/AymanLyesri/WallEclipse"
license=('GPL-3.0-only')
depends=('wayland' 'hyprland' 'jq')
makedepends=('git' 'rust' 'wayland-protocols')
optdepends=('mpvpaper: animated (gif/mp4/webm) wallpapers'
            'ffmpegthumbnailer: fast video poster extraction'
            'ffmpeg: fallback video poster extraction')
provides=('walleclipse')
conflicts=('walleclipse')
source=("git+https://github.com/AymanLyesri/WallEclipse.git")
sha256sums=('SKIP')

pkgver() {
  cd WallEclipse
  local desc
  desc=$(git describe --long --tags 2>/dev/null) || desc=""
  if [ -n "$desc" ]; then
    printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd WallEclipse
  cargo build --release --locked
}

check() {
  cd WallEclipse
  cargo test --locked
}

package() {
  cd WallEclipse
  install -Dm755 target/release/walleclipse "$pkgdir/usr/bin/walleclipse"
}
