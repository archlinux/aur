# Maintainer: AymanLyesri <https://github.com/AymanLyesri>
pkgname=coloreclipse-git
pkgver=0.1.0.r2.g5b336ec
pkgrel=1
pkgdesc="Theme variant and GTK/icon/cursor applier with cwal colors for ArchEclipse"
arch=('x86_64')
url="https://github.com/AymanLyesri/ColorEclipse"
license=('GPL-3.0-only')
depends=('glib2' 'libnotify' 'cwal-git' 'imagemagick' 'psmisc')
makedepends=('git' 'rust')
optdepends=('hyprland: apply the cursor theme via hyprctl'
            'ffmpeg: frame extraction for animated (video/gif) wallpapers'
            'whitesur-gtk-theme: GTK themes the applier selects'
            'whitesur-icon-theme: icon themes the applier selects'
            'phinger-cursors: cursor themes the applier selects')
provides=('coloreclipse')
conflicts=('coloreclipse')
source=("git+https://github.com/AymanLyesri/ColorEclipse.git")
sha256sums=('SKIP')

pkgver() {
  cd ColorEclipse
  local desc
  desc=$(git describe --long --tags 2>/dev/null) || desc=""
  if [ -n "$desc" ]; then
    printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd ColorEclipse
  cargo build --release --locked
}

check() {
  cd ColorEclipse
  cargo test --locked
}

package() {
  cd ColorEclipse
  install -Dm755 target/release/coloreclipse "$pkgdir/usr/bin/coloreclipse"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
