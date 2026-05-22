# Maintainer: 0bCdian <diegoparranava@protonmail.com>
pkgname='waypaper-engine-git'
pkgver=3.0.0.r1.b7585ed
pkgrel=1
pkgdesc="A wallpaper setter GUI with playlist functionality for Wayland and X11 (git)"
arch=('x86_64')
url="https://github.com/0bCdian/Waypaper-Engine"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme')
makedepends=('go' 'pnpm' 'nodejs' 'git')
conflicts=('waypaper-engine')
provides=('waypaper-engine')
optdepends=(
  'awww: animated wallpapers on Wayland'
  'hyprpaper: static image wallpapers on Hyprland'
  'mpvpaper: video wallpapers on wlroots compositors'
  'feh: static image wallpapers on X11'
  'wal-qt: HTML / WebEngine wallpaper backend'
  'xorg-xrandr: monitor detection on X11'
)
_archive="Waypaper-Engine"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_archive"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$_archive"
  make deps
}

build() {
  cd "$_archive"
  make electron
}

package() {
  cd "$_archive"
  make install-system DESTDIR="$pkgdir" INSTALL_PREFIX_SYSTEM=/usr \
    ICON_DIR="$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/waypaper-engine/LICENSE"
}
